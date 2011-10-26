Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RJAk6-0004ez-Og
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 23:10:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9QL4AsO017975
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Oct 2011 14:04:11 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 26 Oct 2011 14:04:10 -0700
Message-ID: <4EA875C9.6020400@windriver.com>
Date: Wed, 26 Oct 2011 16:04:09 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <julian.pidancet@gmail.com>, <openembedded-core@lists.openembedded.org>,
	Scott Garman <scott.a.garman@intel.com>,
	<pkg-shadow-devel@lists.alioth.debian.org>
References: <20111022115412.GM16703@nekral.nekral.homelinux.net>
	<CAKZ=5EWt4QwLeVSJp5v6xgSOX6C_VRpz3hq_PjfCrAGBWU0DEw@mail.gmail.com>
	<20111026205113.GB25451@nekral.nekral.homelinux.net>
In-Reply-To: <20111026205113.GB25451@nekral.nekral.homelinux.net>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p9QL4AsO017975
Subject: Re: --root option in upstream shadow
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Oct 2011 21:10:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

On 10/26/11 3:51 PM, Nicolas Fran=E7ois wrote:
> Hi,
>=20
> On Mon, Oct 24, 2011 at 01:06:11AM +0100, julian.pidancet@gmail.com wro=
te:
>> On Sat, Oct 22, 2011 at 12:54 PM, Nicolas Fran=E7ois
>> <nicolas.francois@centraliens.net> wrote:
>>>
>>> What is the expected behavior when the utility authenticates the call=
er?
>>>  1] authenticate the caller in the caller's chroot
>>>  2] authenticate the caller in the target's chroot
>>>  3] both
>>>
>>> I currently think that 3] would be the right behavior: the caller nee=
ds to
>>> be authenticated to make sure it is allowed to use the tool, then it
>>> should be authenticated on the target to make sure the operation is
>>> allowed.
>>> ...But this is much more complex.
>>>
>>> If this is fine for you, I would prefer to disable this feature when =
the
>>> utility is setuid and not executed by root.
>>>
>>
>> I'm affraid this patch does not do what you think it does. The --root
>> option does not apply to login, but only to the various administrative
>> tools that comes with it (gpasswd, groupadd, groupdel, groupmod,
>> grpconv, grpunconv, passwd, pwconv, pwunconv, useradd, userdel).
>=20
> I understand this correctly.
>=20
> Lets take the passwd use case.
> passwd usually authenticates the caller (when UID=3D=3D0, this authenti=
cation
> is usually skipped), then asks for the new password, then update the
> password databases.
> passwd is suid and can be used by non root users to change the caller's
> password. What should be the behavior of passwd is such case?
> With the current patch, an user with UID 1000 will be allowed to change=
 the
> password of the user from the target chroot with the same UID 1000.=20

The existing behavior we use in OpenEmbedded-core is emulate root user (w=
e do
this by call intercepting, and avoiding suid/sgid)..  But under the hood,=
 it all
comes down to file permissions.  If we have permission to modify the file=
 we do
-- otherwise it fails.  This is equivalent to the root user.

There are reasonable cases where a non-root user (with permission to modi=
fy the
passwd/group file within a chroot) will want to do so..  This sounds like=
 a
security flaw, but it's not because the permissions are added to the chro=
ot
after the filesystem is finished being constructed.

> In the patched tools you indicated, gpasswd is also suid.
> And all the others can be suid when configured with
> --enable-account-tools-setuid
>=20
> My proposal is to only support --root for root. For non suid utils,
> regular users will be denied chroot anyway, hence: "disable this featur=
e
> when the utility is setuid and not executed by root."

I agree, with setuid it doesn't make sense to allow --root functionality.=
  Would
it be reasonable to drop the setuid/gid if the user attempts --root
functionality.  Internally act as if the user is root and then simply all=
ow the
filesystem dictate success or failure?

> In your use case (for packaging), I assume the tools are always called =
by
> root. Then this restriction should not affect you.

The tool THINKS it's called as root, but it's actually called as a user. =
 (We
use a utility called pseudo that intercepts calls and emulated root capab=
ilities.)

But some of our embedded requirements are unique to our build environment=
s.  So
if the default action is only root can perform the --root command, we can=
 easily
remove the check -- or change it that it doesn't function if setuid for o=
ur
purposes.  (but with pseudo I don't think this will be an issue.)

>> It allows OE to manipulate passwd and group files that are located in
>> a sysroot by chrooting into it, because all these programs have their
>> path to /etc/passwd and friends hardcoded.
>=20
> The advantage is not only that the destination user/group files are
> changed, but also that they are changed considering the configuration o=
f
> the target system (e.g. PAM, /etc/login.defs, ...)

Absolutely!

Thanks.  Anything we can do to get this upstream will make it much easier=
 for us
in the long term.

--Mark

> Best Regards,



