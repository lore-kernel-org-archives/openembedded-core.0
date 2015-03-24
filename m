Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 26EB073B9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 15:53:27 +0000 (UTC)
Received: by pabxg6 with SMTP id xg6so216826492pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=2ybW6HmGZOf8hwmllTzQb3/cAuByKwyArVHUCTNnHFA=;
	b=UG56Q5uhVaTV8UmenlaNo+kDsD3Ey/rm/2yaU8+JSok1L4CdjlYUHmfHMV7D8kJfey
	hgAKnDWkfdDy8bqSftlfS+BxHk60LQpXBvq4B8iq5PCZjUi14oDD67s9jSYco/LNkLGo
	hMxVldx0nwnf4XXEnJ+ACD5vRqZvfqApJy+TI+AaYUZa9XfvsEt/3fXPh2MH6fD3ZMHt
	ZFWpOz1OHjcVuVR9Ujs7s5+X2U2BiFiOT4l+HNZ/DD/Od2ZAH790V50r0bqVTSLDiWHL
	mmlHpMJ1yp6TV5aXyyylHzV5kKkma88ni/pn3wJmFg88TqMlJO/3kqLXT2zRjbrq+3ur
	sSQA==
X-Received: by 10.68.253.226 with SMTP id ad2mr8902855pbd.98.1427212409234;
	Tue, 24 Mar 2015 08:53:29 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:ec48:5597:def8:2ec7?
	([2601:9:3580:84c:ec48:5597:def8:2ec7])
	by mx.google.com with ESMTPSA id pu9sm4567431pdb.49.2015.03.24.08.53.28
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Mar 2015 08:53:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
X-Priority: 3 (Normal)
In-Reply-To: <59624.10.254.107.142.1427211967.squirrel@linux.intel.com>
Date: Tue, 24 Mar 2015 08:53:27 -0700
Message-Id: <037A72AC-D36E-491E-84D1-16D6F1B014A0@gmail.com>
References: <1427156894-24614-1-git-send-email-randy.e.witt@linux.intel.com>
	<1427156894-24614-3-git-send-email-randy.e.witt@linux.intel.com>
	<CAMKF1srT2URjkAjC4uEA6GFiAQqywgfBewS8t=Aoemym-rKuew@mail.gmail.com>
	<59624.10.254.107.142.1427211967.squirrel@linux.intel.com>
To: randy.e.witt@linux.intel.com
X-Mailer: Apple Mail (2.2070.6)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] image.bbclass: Empty /var/volatile if it is a mount point
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Mar 2015 15:53:28 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


> On Mar 24, 2015, at 8:46 AM, randy.e.witt@linux.intel.com wrote:
>=20
>> On Mon, Mar 23, 2015 at 5:28 PM, Randy Witt
>> <randy.e.witt@linux.intel.com> wrote:
>>> If /var/volatile is a mount point it shouldn't contain any files =
before
>>> mount time. If files are there, they will no longer be able to be
>>> accessed
>>> once the tmpfs gets mounted at /var/volatile.
>>=20
>> why not use copy-bind when mounting it second time as tmpfs ?
>>=20
>=20
> Khem, could you elaborate? I'm not sure I know the mechanism to which =
you
> are referring.

copy bind will copy the contents from old place to new mount. Then =
hopefully you do not lose the content
that was already there before remount happens see VOLATILE_BINDS =
implementation.

>=20
>>>=20
>>> This problem can be seen for instance when systemd creates
>>> /var/volatile/log/journal as part of its package installation. It =
then
>>> assumes the journal is persistent even though =
/var/volatile/log/journal
>>> goes away shortly thereafter.
>>>=20
>>> This change makes sure that there are no files in /var/volatile if =
it is
>>> to be used as a mount point.
>>>=20
>>> [Yocto #7388]
>>>=20
>>> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>>> ---
>>> meta/classes/image.bbclass | 16 ++++++++++++++++
>>> 1 file changed, 16 insertions(+)
>>>=20
>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>>> index 89eb5f3..dfedf9d 100644
>>> --- a/meta/classes/image.bbclass
>>> +++ b/meta/classes/image.bbclass
>>> @@ -181,6 +181,8 @@ POSTINST_LOGFILE ?=3D
>>> "${localstatedir}/log/postinstall.log"
>>> SYSTEMD_DEFAULT_TARGET ?=3D '${@bb.utils.contains("IMAGE_FEATURES",
>>> "x11-base", "graphical.target", "multi-user.target", d)}'
>>> ROOTFS_POSTPROCESS_COMMAND +=3D =
'${@bb.utils.contains("DISTRO_FEATURES",
>>> "systemd", "set_systemd_default_target; ", "", d)}'
>>>=20
>>> +ROOTFS_POSTPROCESS_COMMAND +=3D 'empty_var_volatile;'
>>> +
>>> # some default locales
>>> IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
>>>=20
>>> @@ -377,6 +379,20 @@ set_systemd_default_target () {
>>>        fi
>>> }
>>>=20
>>> +# If /var/volatile is not empty, we have seen problems where =
programs
>>> such as the
>>> +# journal make assumptions based on the contents of /var/volatile. =
The
>>> journal
>>> +# would then write to /var/volatile before it was mounted, thus =
hiding
>>> the
>>> +# items previously written.
>>> +#
>>> +# This change is to attempt to fix those types of issues in a way =
that
>>> doesn't
>>> +# affect users that may not be using /var/volatile.
>>> +empty_var_volatile () {
>>> +       match=3D`awk '$1 !~ "#" && $2 ~ /\/var\/volatile/{print $2}'
>>> ${IMAGE_ROOTFS}/etc/fstab 2> /dev/null`
>>> +       if [ -n "$match" ]; then
>>> +               find ${IMAGE_ROOTFS}/var/volatile -mindepth 1 =
-delete
>>> +       fi
>>> +}
>>> +
>>> # Turn any symbolic /sbin/init link into a file
>>> remove_init_link () {
>>>        if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
>>> --
>>> 1.9.3
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>=20


