Return-Path: <connor.smith@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 82ADD739BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 17:09:25 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t6AH9OJj021310; Fri, 10 Jul 2015 12:09:24 -0500
Received: from [10.2.106.146] ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015071012092474-930322 ;
	Fri, 10 Jul 2015 12:09:24 -0500 
Message-ID: <559FFC43.4030505@ni.com>
Date: Fri, 10 Jul 2015 12:09:23 -0500
From: Connor Smith <connor.smith@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <559F02AE.3010501@ni.com>
	<CAJTo0LZwXTDEKtR8+3EHfdEpMbB4P9nxyaC1odqW_dGHz5svAQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZwXTDEKtR8+3EHfdEpMbB4P9nxyaC1odqW_dGHz5svAQ@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 07/10/2015 12:09:24 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 07/10/2015 12:09:24 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-07-10_07:, , signatures=0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Library Patches Causing Many Packages to Rebuild
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
X-List-Received-Date: Fri, 10 Jul 2015 17:09:29 -0000
Content-Type: multipart/alternative;
	boundary="------------030304080500010508060909"

--------------030304080500010508060909
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8



On 07/10/2015 04:20 AM, Burton, Ross wrote:
>
> On 10 July 2015 at 00:24, Connor Smith <connor.smith@ni.com> wrote:
>
>     rpm-native appears to be recompiling because the do_populate_sysroot
>     hash is changing for the native versions of openssl and python. I'm not
>     sure why either of these tasks are changing.
>
>
> This is likely the source of a lot of the rebuilds.  openssl was changed, openssl-native rebuilds, causing a rebuild of rpm-native, which likely causes a re-package of everything.
>
> If this doesn't explain the situation then attaching the cooker log demonstrating the problem might help identify it.
>
> Ross

Ah, that makes sense. I investigated some more, and the do_package task
has a hard-coded dependency on rpm-native. Removing this dependency and
rebuilding resolved the issue; the only ipks being rebuilt now are from
packages that depend on openssl and need to be recompiled.

Should this dependency be based off PACKAGE_CLASSES, or is it necessary
to always depend on rpm-native? We're using opkg, not rpm.

Thanks,
Connor Smith


--------------030304080500010508060909
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Type=
">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <br>
    <br>
    On 07/10/2015 04:20 AM, Burton, Ross wrote:<br>
    <span style=3D"white-space: pre;">&gt;<br>
      &gt; On 10 July 2015 at 00:24, Connor Smith
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:connor.smith@ni.com=
">&lt;connor.smith@ni.com&gt;</a> wrote:<br>
      &gt;<br>
      &gt;=C2=A0=C2=A0=C2=A0=C2=A0 rpm-native appears to be recompiling bec=
ause the
      do=5Fpopulate=5Fsysroot<br>
      &gt;=C2=A0=C2=A0=C2=A0=C2=A0 hash is changing for the native versions=
 of openssl and
      python. I'm not<br>
      &gt;=C2=A0=C2=A0=C2=A0=C2=A0 sure why either of these tasks are chang=
ing.<br>
      &gt;<br>
      &gt;<br>
      &gt; This is likely the source of a lot of the rebuilds.=C2=A0 openssl
      was changed, openssl-native rebuilds, causing a rebuild of
      rpm-native, which likely causes a re-package of everything.<br>
      &gt;<br>
      &gt; If this doesn't explain the situation then attaching the
      cooker log demonstrating the problem might help identify it.<br>
      &gt;<br>
      &gt; Ross</span><br>
    <br>
    Ah, that makes sense. I investigated some more, and the do=5Fpackage
    task<br>
    has a hard-coded dependency on rpm-native. Removing this dependency
    and<br>
    rebuilding resolved the issue; the only ipks being rebuilt now are
    from<br>
    packages that depend on openssl and need to be recompiled.<br>
    <br>
    Should this dependency be based off PACKAGE=5FCLASSES, or is it
    necessary<br>
    to always depend on rpm-native? We're using opkg, not rpm.<br>
    <br>
    Thanks,<br>
    Connor Smith<br>
    <br>
  </body>
</html>

--------------030304080500010508060909--
