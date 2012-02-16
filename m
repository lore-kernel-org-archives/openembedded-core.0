Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1Ry8tu-0007Fp-MS
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 22:30:02 +0100
Received: by iaby12 with SMTP id y12so3653295iab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 13:21:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.11.129 with SMTP id q1mr5331682igb.23.1329427308675; Thu,
	16 Feb 2012 13:21:48 -0800 (PST)
Received: by 10.231.15.73 with HTTP; Thu, 16 Feb 2012 13:21:48 -0800 (PST)
X-Originating-IP: [146.115.15.122]
In-Reply-To: <4F3C4F8B.30706@windriver.com>
References: <CA+b4E8wdD1bQN77Sg=ew+-AbHtyrn4N87Ud6+BwCFdW56BO_kQ@mail.gmail.com>
	<4F3C4F8B.30706@windriver.com>
Date: Thu, 16 Feb 2012 16:21:48 -0500
Message-ID: <CA+b4E8w1V2W2dnDNVaxFvjOb_6edswiHK8ST+ntMCr9ivOyz=w@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQkaks1/8JyTm6Lvvz6VE5B8zQveMOWNTy7CO25mm7dMcotDMD7X/Stc7yk3KHDST3yIXJ9F
Subject: Re: Problem building core-image-basic: Cannot create symlink from ./var/run to 'volatile/run'
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
X-List-Received-Date: Thu, 16 Feb 2012 21:30:02 -0000
Content-Type: multipart/alternative; boundary=e89a8f50320c7d00df04b91b6aaf

--e89a8f50320c7d00df04b91b6aaf
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 15, 2012 at 7:36 PM, Mark Hatle <mark.hatle@windriver.com>wrote:

> On 2/15/12 3:21 PM, Brandon Stafford wrote:
>
>> Hi all,
>>
>> In trying to build core-image-basic for qemuarm, I ran into an error:
>> extract_archive: Cannot create symlink from ./var/run to 'volatile/run':
>> File
>> exists.
>>
>> (The full error message is posted here: http://pastebin.com/QPic3uHx )
>>
>> The issue is most likely that something created the directory of
> "/var/run", and then the later base-files attempted to create the symlink
> which caused the failure.

--Mark
>

Thanks for the suggestion, Mark.

It appears that dbus is the source of the conflict. If I add /volatile to
the paths, as in the patch below, the error disappears. I can't test it in
actual operation because of subsequent errors.

Is this the right fix?

diff --git a/meta/recipes-core/dbus/dbus.inc
b/meta/recipes-core/dbus/dbus.inc
index 2a25256..9dc40cf 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -81,9 +81,9 @@ do_install() {
             > ${D}${sysconfdir}/default/volatiles/99_dbus


-       mkdir -p ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
+       mkdir -p ${D}${localstatedir}/volatile/run/dbus
${D}${localstatedir}/volatile/lib/dbus

-       chown messagebus:messagebus ${D}${localstatedir}/run/dbus
${D}${localstatedir}/lib/dbus
+       chown messagebus:messagebus ${D}${localstatedir}/volatile/run/dbus
${D}${localstatedir}/volatile/lib/dbus

        chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
        chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper

Cheers,
Brandon

--e89a8f50320c7d00df04b91b6aaf
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Feb 15, 2012 at 7:36 PM, Mark Hatle <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windri=
ver.com</a>&gt;</span> wrote:</div><div class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On 2/15/12 3:21 PM, Brandon Stafford wr=
ote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div>
Hi all,<br>
<br>
In trying to build core-image-basic for qemuarm, I ran into an error:<br>
extract_archive: Cannot create symlink from ./var/run to &#39;volatile/run&=
#39;: File<br>
exists.<br>
<br>
(The full error message is posted here: <a href=3D"http://pastebin.com/QPic=
3uHx" target=3D"_blank">http://pastebin.com/QPic3uHx</a> )<br><br></div></b=
lockquote>
The issue is most likely that something created the directory of &quot;/var=
/run&quot;, and then the later base-files attempted to create the symlink w=
hich caused the failure.=A0</blockquote></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">

--Mark<br></blockquote><div><br></div><div><div>Thanks for the suggestion, =
Mark.</div><div><br></div><div>It appears that dbus is the source of the co=
nflict. If I add /volatile to the paths, as in the patch below, the error d=
isappears. I can&#39;t test it in actual operation because of subsequent er=
rors.</div>
<div><br></div><div>Is this the right fix?</div><div><br></div><div><div>di=
ff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.in=
c</div><div>index 2a25256..9dc40cf 100644</div><div>--- a/meta/recipes-core=
/dbus/dbus.inc</div>
<div>+++ b/meta/recipes-core/dbus/dbus.inc</div><div>@@ -81,9 +81,9 @@ do_i=
nstall() {</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0&gt; ${D}${sysconfdir}/defa=
ult/volatiles/99_dbus</div><div>=A0</div><div>=A0</div><div>- =A0 =A0 =A0 m=
kdir -p ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus</div>
<div>+ =A0 =A0 =A0 mkdir -p ${D}${localstatedir}/volatile/run/dbus ${D}${lo=
calstatedir}/volatile/lib/dbus</div><div>=A0</div><div>- =A0 =A0 =A0 chown =
messagebus:messagebus ${D}${localstatedir}/run/dbus ${D}${localstatedir}/li=
b/dbus</div>
<div>+ =A0 =A0 =A0 chown messagebus:messagebus ${D}${localstatedir}/volatil=
e/run/dbus ${D}${localstatedir}/volatile/lib/dbus</div><div>=A0</div><div>=
=A0 =A0 =A0 =A0 chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-=
helper</div><div>
=A0 =A0 =A0 =A0 chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper</div=
></div><div><br></div><div>Cheers,</div><div>Brandon</div></div></div>

--e89a8f50320c7d00df04b91b6aaf--
