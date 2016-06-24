Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCD360589
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 14:07:46 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id f6so116480289lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 07:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=bAzNY5gNc9b7MJzVItSAP2HgNylMTrCRNvZGvDBcnms=;
	b=ef2TO+oynDLUwxOPwgBKSPPa55XxkAWWfTBtZKuAE7UjIh5xHy2WF8rdyIxF2DAYGc
	95RY2nHv3oWzXUxl0j8mCDFCUWs5KO8/sWIRZ1ysbrGnSoThmWONhsO6YPnouPiUEt1l
	Yw/CspKgCOqzQ9OkyTjZL5UOuPgrU8spz+YDAHLihq6NhvcUnpNTPkm6WUbSh2nvS+az
	jMuZ21rqWB/pFijk00mCqlBj3cmcZd0xSGeM//mdsIGBcKqLdezWBwJkAjNUf6m6wtqV
	84GoqihJ/LmF68UG6vSRTZK1oGrfPynKr3RKsSPR91CCyoFVPbXJ5QLfqoknyLKEOZE6
	qjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=bAzNY5gNc9b7MJzVItSAP2HgNylMTrCRNvZGvDBcnms=;
	b=Y7S8n9fdr0BN4Duj05FQB1VcRLhD1OaX59b0EqLo8+3/OLzoAA4muZ4xBaPcriPgM3
	4LuMych1CUiq/gReOrlC8L0x09YfLq1deM4s42M9vBCBaadzwBiL4au1eKjQaUmSfkhn
	Oa0IQjqqt4NsEBSWYBLuNiODTleTbVmHRyGSiAVS4SWazbFGeu6OoeTotRspX4d+tHU4
	dLnMeJP97hA7iFUa8PPDCI6QYCSbbNg++QEEXhwA08WzGpwIattk6yxKjwmtVeMr5lQX
	9jj9q6cMPeNnD9eYmsmLrdVyVPfVE7EzedKRpmkJO3E0yL1A9Py4qJXrVWGzYPTY8zVc
	ilVQ==
X-Gm-Message-State: ALyK8tIUy3xGykaKHVx3hbsDjdfQSNJ/vMz7d2XIW5yAMbLm2gLKzKQfmrKukrZr938zzuCPA/mQI6jlVU2rag==
X-Received: by 10.25.161.142 with SMTP id k136mr1161960lfe.0.1466777266562;
	Fri, 24 Jun 2016 07:07:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.5.215 with HTTP; Fri, 24 Jun 2016 07:07:16 -0700 (PDT)
X-Originating-IP: [179.105.243.72]
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 24 Jun 2016 11:07:16 -0300
Message-ID: <CAAPZna2Gu=QZ-mFn1FPaq3HfNSbSXhFPafWWY_FQTU+OO6e-1w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: WIC error when using rawcopy
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
X-List-Received-Date: Fri, 24 Jun 2016 14:07:48 -0000
Content-Type: multipart/alternative; boundary=001a11410fb4f0402e053606b145

--001a11410fb4f0402e053606b145
Content-Type: text/plain; charset=UTF-8

Hi all!

I'm getting one error when trying to make an image using wic.
My wks file is:


part u-boot --source rawcopy --sourceparams="file=u-boot.imx" --ondisk
mmcblk --no-table --align 1
part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat
--label boot --align 8192 --size 25M --extra-space 0
part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label system --size
512M --align 8192 --extra-space 0
part / --size 512M --ondisk mmcblk0 --align 8192 --extra-space 0

bootloader --ptable msdos


and when building an image I get error:

Log data follows:
| DEBUG: Executing python function set_image_size
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_wic
| Error: exec_cmd: dd
if=/home/user/src/prj/build/tmp/deploy/images/nitrogen6x/core-image-minimal-nitrogen6x-20160624134453/build/u-boot.imx
of=/home/user/src/prj/build/tmp/deploy/images/nitrogen6x/core-image-minimal-nitrogen6x-20160624134453/build/core-image-201606241045-mmcblk.direct
bs=512 seek=2 count=942 conv=notrunc returned '1' instead of 0
| Checking basic build environment...
| Done.
|
| Creating image(s)...
|
| WARNING:
/home/user/src/prj/build/tmp/work/nitrogen6x-prj-linux-gnueabi/core-image-minimal/1.0-r0/temp/run.do_image_wic.31619:1
exit 1 from 'BUILDDIR="/home/user/src/prj/build" wic create "$wks" --vars
"/home/user/src/prj/build/tmp/sysroots/nitrogen6x/imgdata/" -e
"core-image-minimal" -o "$out/"'


If I remove line:
part u-boot --source rawcopy --sourceparams="file=u-boot.imx" --ondisk
mmcblk --no-table --align 1

image builds fine, so I think the problem it's on rawcopy.

After I run bitbake and execution fail, I cd to wic build directory
deploy/images/nitrogen6x/core-image-minimal-nitrogen6x-20160624135131/build
and u-boot.imx is not in this dir.

Can you help me on this? I'm using krogoth branch.

Regards,

Fabio

--001a11410fb4f0402e053606b145
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi all!<br><br></div><div class=3D"gmail_defau=
lt" style=3D"font-family:monospace,monospace;font-size:small">I&#39;m getti=
ng one error when trying to make an image using wic. <br>My wks file is:<br=
><br><br>part u-boot --source rawcopy --sourceparams=3D&quot;file=3Du-boot.=
imx&quot; --ondisk mmcblk --no-table --align 1<br>part /boot --source booti=
mg-partition --ondisk mmcblk0 --fstype=3Dvfat --label boot --align 8192 --s=
ize 25M --extra-space 0<br>part / --source rootfs --ondisk mmcblk0 --fstype=
=3Dext4 --label system --size 512M --align 8192 --extra-space 0<br>part / -=
-size 512M --ondisk mmcblk0 --align 8192 --extra-space 0<br><br>bootloader =
--ptable msdos<br><br><br></div><div class=3D"gmail_default" style=3D"font-=
family:monospace,monospace;font-size:small">and when building an image I ge=
t error:<br><br>Log data follows:<br>| DEBUG: Executing python function set=
_image_size<br>| DEBUG: Python function set_image_size finished<br>| DEBUG:=
 Executing shell function do_image_wic<br>| Error: exec_cmd: dd if=3D/home/=
user/src/prj/build/tmp/deploy/images/nitrogen6x/core-image-minimal-nitrogen=
6x-20160624134453/build/u-boot.imx of=3D/home/user/src/prj/build/tmp/deploy=
/images/nitrogen6x/core-image-minimal-nitrogen6x-20160624134453/build/core-=
image-201606241045-mmcblk.direct bs=3D512 seek=3D2 count=3D942 conv=3Dnotru=
nc returned &#39;1&#39; instead of 0<br>| Checking basic build environment.=
..<br>| Done.<br>|<br>| Creating image(s)...<br>|<br>| WARNING: /home/user/=
src/prj/build/tmp/work/nitrogen6x-prj-linux-gnueabi/core-image-minimal/1.0-=
r0/temp/run.do_image_wic.31619:1 exit 1 from &#39;BUILDDIR=3D&quot;/home/us=
er/src/prj/build&quot; wic create &quot;$wks&quot; --vars &quot;/home/user/=
src/prj/build/tmp/sysroots/nitrogen6x/imgdata/&quot; -e &quot;core-image-mi=
nimal&quot; -o &quot;$out/&quot;&#39;<br><br><br></div><div class=3D"gmail_=
default" style=3D"font-family:monospace,monospace;font-size:small">If I rem=
ove line:<br>part u-boot --source rawcopy --sourceparams=3D&quot;file=3Du-b=
oot.imx&quot; --ondisk mmcblk --no-table --align 1<br><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
">image builds fine, so I think the problem it&#39;s on rawcopy.<br><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:monospace,monospace;fo=
nt-size:small">After I run bitbake and execution fail, I cd to wic build di=
rectory deploy/images/nitrogen6x/core-image-minimal-nitrogen6x-201606241351=
31/build and u-boot.imx is not in this dir.<br><br></div><div class=3D"gmai=
l_default" style=3D"font-family:monospace,monospace;font-size:small">Can yo=
u help me on this? I&#39;m using krogoth branch.<br><br></div><div class=3D=
"gmail_default" style=3D"font-family:monospace,monospace;font-size:small">R=
egards,<br><br></div><div class=3D"gmail_default" style=3D"font-family:mono=
space,monospace;font-size:small">Fabio<br></div></div>

--001a11410fb4f0402e053606b145--
