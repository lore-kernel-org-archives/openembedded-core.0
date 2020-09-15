Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web12.2367.1600128781048045119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 17:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from [10.200.20.196] (unknown [10.200.20.196])
	by smtp0.taitradio.net (Postfix) with ESMTP id 5D45122027A
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 12:12:58 +1200 (NZST)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: "Douglas" <douglas.royds@taitradio.com>
Subject: nativesdk-linux-libc-headers with two different MACHINEs
Message-ID: <08f090d6-65c6-da98-ac7f-a2bc803c805a@taitradio.com>
Date: Tue, 15 Sep 2020 12:12:58 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------C9662ACA01BD5053D26606C6"
Content-Language: en-GB

--------------C9662ACA01BD5053D26606C6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

For the experiment, I wanted to see whether I could achieve no task=20
signature change when building nativesdk-glibc for two different=20
MACHINEs, but I found that the do_install sigdata for=20
nativesdk-linux-libc-headers changed. We're installing the=20
linux-libc-headers for the build machine, so it seems to make sense to=20
take control of the TARGET_CC_KERNEL_ARCH:

    diff --git a/meta/classes/nativesdk.bbclass
    b/meta/classes/nativesdk.bbclass
    index 32c3aa32ad..655439dd73 100644
    --- a/meta/classes/nativesdk.bbclass
    +++ b/meta/classes/nativesdk.bbclass
    @@ -47,6 +47,7 @@ TARGET_VENDOR =3D "${SDK_VENDOR}"
     =C2=A0TARGET_OS =3D "${SDK_OS}"
     =C2=A0TARGET_PREFIX =3D "${SDK_PREFIX}"
     =C2=A0TARGET_CC_ARCH =3D "${SDK_CC_ARCH}"
    +TARGET_CC_KERNEL_ARCH =3D "${SDK_CC_ARCH}"
     =C2=A0TARGET_LD_ARCH =3D "${SDK_LD_ARCH}"

Which leaves me with:

    basehash changed from 42ed3480096bb7ea53b60dc876da0613 to
    38ea60bdac041673f2c491d7bbabe17c
    Variable MACHINE value changed from 'qemuarm' to 'qemux86-64'
    runtaskdeps changed:
    linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:nati=
vesdk
    with hash cbb186fe33cd69cb0b06384e4d50a244
     =C2=A0changed to
    linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:nati=
vesdk
    with hash 4d34d6981b79d0fccc768566bf2fa533
    Hash for dependent task
    linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:nati=
vesdk
    changed from cbb186fe33cd69cb0b06384e4d50a244 to
    4d34d6981b79d0fccc768566bf2fa533

The configure and compile tasks for linux-libc-headers are both set to=20
noexec. For the experiment, I added an empty do_configure task, with=20
this result on the do_configure sigdata:

    basehash changed from f13c2a2066fa48f0ccac35c085537c71 to
    bb13f2b1b1e7e6666376f3fb5a8ec888
    Variable MACHINE value changed from 'qemux86-64' to 'qemuarm'

What to do? Why is the MACHINE variable included in the task signature=20
(it is unset in run.do_configure)? Adding it to BB_HASHBASE_WHITELIST=20
had no effect. What am I missing here?


--------------C9662ACA01BD5053D26606C6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>For the experiment, I wanted to see whether I could achieve no
      task signature change when building nativesdk-glibc for two
      different MACHINEs, but I found that the do_install sigdata for
      nativesdk-linux-libc-headers changed. We're installing the
      linux-libc-headers for the build machine, so it seems to make
      sense to take control of the TARGET_CC_KERNEL_ARCH:</p>
    <blockquote>
      <p><tt>diff --git a/meta/classes/nativesdk.bbclass
          b/meta/classes/nativesdk.bbclass</tt><tt><br>
        </tt><tt>index 32c3aa32ad..655439dd73 100644</tt><tt><br>
        </tt><tt>--- a/meta/classes/nativesdk.bbclass</tt><tt><br>
        </tt><tt>+++ b/meta/classes/nativesdk.bbclass</tt><tt><br>
        </tt><tt>@@ -47,6 +47,7 @@ TARGET_VENDOR =3D "${SDK_VENDOR}"</tt>=
<tt><br>
        </tt><tt>=C2=A0TARGET_OS =3D "${SDK_OS}"</tt><tt><br>
        </tt><tt>=C2=A0TARGET_PREFIX =3D "${SDK_PREFIX}"</tt><tt><br>
        </tt><tt>=C2=A0TARGET_CC_ARCH =3D "${SDK_CC_ARCH}"</tt><tt><br>
        </tt><tt>+TARGET_CC_KERNEL_ARCH =3D "${SDK_CC_ARCH}"</tt><tt><br>
        </tt><tt>=C2=A0TARGET_LD_ARCH =3D "${SDK_LD_ARCH}"</tt><br>
      </p>
    </blockquote>
    <p>Which leaves me with:</p>
    <blockquote>
      <p><tt>basehash changed from 42ed3480096bb7ea53b60dc876da0613 to
          38ea60bdac041673f2c491d7bbabe17c</tt><tt><br>
        </tt><tt>Variable MACHINE value changed from 'qemuarm' to
          'qemux86-64'</tt><tt><br>
        </tt><tt>runtaskdeps changed:</tt><tt><br>
        </tt><tt>linux-libc-headers/linux-libc-headers_4.18.bb.do_compile=
:virtual:nativesdk
          with hash cbb186fe33cd69cb0b06384e4d50a244</tt><tt><br>
        </tt><tt>=C2=A0changed to</tt><tt><br>
        </tt><tt>linux-libc-headers/linux-libc-headers_4.18.bb.do_compile=
:virtual:nativesdk
          with hash 4d34d6981b79d0fccc768566bf2fa533</tt><tt><br>
        </tt><tt>Hash for dependent task
linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:nativesd=
k
          changed from cbb186fe33cd69cb0b06384e4d50a244 to
          4d34d6981b79d0fccc768566bf2fa533</tt><br>
      </p>
    </blockquote>
    <p>The configure and compile tasks for linux-libc-headers are both
      set to noexec. For the experiment, I added an empty do_configure
      task, with this result on the do_configure sigdata:</p>
    <blockquote>
      <p><tt>basehash changed from f13c2a2066fa48f0ccac35c085537c71 to
          bb13f2b1b1e7e6666376f3fb5a8ec888</tt><tt><br>
        </tt><tt>Variable MACHINE value changed from 'qemux86-64' to
          'qemuarm'</tt></p>
    </blockquote>
    <p>What to do? Why is the MACHINE variable included in the task
      signature (it is unset in run.do_configure)? Adding it to
      BB_HASHBASE_WHITELIST had no effect. What am I missing here?<br>
    </p>
  </body>
</html>

--------------C9662ACA01BD5053D26606C6--
