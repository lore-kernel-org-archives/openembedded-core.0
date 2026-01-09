Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4264BD277C9
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 23:44:36 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1279.1768002268425405305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 15:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OOswCU13;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XkKtVfbU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609MuRXu2460442
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Jan 2026 23:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2V/qGIfcT6bqagURRWvDYEoZbUpe7B4v1q8Vz7CY9I=; b=OOswCU13VpRudHlJ
	keLakikXs8sy7oc/7YH72BcV4xYkqLAwNWxcxCrSBcsn/KJWla5Kfx3+oBb/0xdy
	iZN81U0ab607EjSkKajRhPmQGQW8W2bPIgX4WpFqymQLcUT4HjeRDDdVfhnRYv+k
	F49XJmzUsGJ02dclTVZscxEX/zybPfsZsiymoZhq22GQmYf009V9uCXcfGFLSpvA
	Iukpx+YCl+af8QpdZau+gboqEtZhe/+LkdxM/AQ9AshI4pKFRTnw5Qlg7EmRXpyi
	nSQUl30AGyJy2+7l9L/eY74BaP3rzmmCiXq7zvvyiuJnX7qrf8Mv45liVygqFZQ6
	CNtEzg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkawe02n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 23:44:27 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-645535ac027so6993335d50.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 15:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768002267; x=1768607067; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2V/qGIfcT6bqagURRWvDYEoZbUpe7B4v1q8Vz7CY9I=;
        b=XkKtVfbUSWtgYoVFhmxCkKwiVTuziciNUK37QCsLoImflSopRRNwp9yQFgYT0Mid4x
         ZwagNAsxkSoTYMbgeLjRw/Qoe57JX2+sZVjPaggLzDRPYJd4znTfJFSO/DXBbQJsF1ik
         KEmreKiZ8hlRQMGpGYIIBBgRxWl0ZdEaiVWnMqVpoltOulBOOQnEdZMjVhoEtxWWtLYl
         36DKQ+ArRKZhVdkjeQY3uhk9LkyQqGeuv3UJ85aMadB2YCsNa7GYjyU1XiFp7gbPrz4d
         mJWjf2vsqLxjjYoZH0NPUq8apvEUxU1/QISXgFLOK+z7pj9sQTjh+y03tvIeS6i7LN7G
         IBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768002267; x=1768607067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e2V/qGIfcT6bqagURRWvDYEoZbUpe7B4v1q8Vz7CY9I=;
        b=DPdjwyTN5HYc6x1UNiK4r8aLcehyHTg+YYKer5bIxX2FUxWx/hxIWh5XLbnkEE+Vk0
         QRIFWjj22huJffcfgrnGut9491kQUXug5Bib6m/S3aFykXCAtxLHwpHSm333uLBIYuhL
         yydN+QNUf3gjT/zZI1OmWCNbDuUmaH4oFAuO08TQS7ZYekPuFsaOYkRPpME9QvxsEyBK
         nNYGG4wzY0pLl7pdowPTf2sKSPOj4NvXWKzmu9F15WdxR2lx5LZ4RGwUf5KQ2HMfO8IR
         LY81FRTzzrZ+JCdf3N8Gx9TizzPUdsKo6gZZD+2tR5byxzp2EevWURoT0r466z0VNxBP
         5lMA==
X-Forwarded-Encrypted: i=1; AJvYcCVaAgKYy65+iThEYy1lOEdd3L5AEImyLgqK9HB3rjKM0Pyu9W3Mmc4vvep849AwP8rRb0FJY9J/26RBPNlNHA+BzA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxOEw0hdAraj1HDwrR2J9udXxbYw2VQNKP9c7hDkYi1hBu7/a5P
	4yLREVhFSkiS1x3ylpBuV9pU3hlBA62zHLbH2/BDqc0Q3vLFJJzT+Zd9mbVzGBzwb9/TtOzblGf
	2CM7RGnfvAjxitNgUi74a7IzQK8BS/TETfzAgdkT0lYHPvyky8Llx4wBE1TALZFHTIdfmMnsF/S
	k14RGQHjFMdPpl2DAs9yllIMe5bz1ENiiGOB5/AZ1BC6vxnhYNBLn3x15t2Q==
X-Gm-Gg: AY/fxX4qHPRtrNp7D4BCs3Sy+XiQktWqWZtK8lCuchqPFGNBMKonyZZbORbKxYeNhrC
	pR32TM4N0W4y2k25nB5UEr3ISHEIuLG90kZMjoU1RY8xK4MoF1dppYcDZR3sDIPLk4tvdfmp2XM
	Hg7NDozY8VbCucw7o28MAzKLfnbhhqyIN6UMGeOodtA/JHalKUpXBXFlgyqa24y97A6tg=
X-Received: by 2002:a05:690e:2542:b0:646:7c7a:c5b5 with SMTP id 956f58d0204a3-64716bd4a75mr7558880d50.45.1768002266970;
        Fri, 09 Jan 2026 15:44:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGyTcJFsMRPnpOL/OxgRBdiHfvrQb4a33abBLkNSqcolMt42VNQjvDnStvxzidgXI3oCfqvDrG0amxd2Rf+iU=
X-Received: by 2002:a05:690e:2542:b0:646:7c7a:c5b5 with SMTP id
 956f58d0204a3-64716bd4a75mr7558872d50.45.1768002266435; Fri, 09 Jan 2026
 15:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20251023134656.2059483-1-ecordonnier@snap.com>
 <20251023134656.2059483-2-ecordonnier@snap.com> <2da2af64-1607-49f3-a438-43525b4b8b02@gmail.com>
 <CAHUKmYbfri0mDeJJ6FH1YVtNe9R_YTdC8iFQxOx7zLRqizvhKA@mail.gmail.com> <CAMKF1sqn_G1QjZB0SJhvWXKS8e5amjs5e2swZUZNsakivNs+Eg@mail.gmail.com>
In-Reply-To: <CAMKF1sqn_G1QjZB0SJhvWXKS8e5amjs5e2swZUZNsakivNs+Eg@mail.gmail.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 20:43:49 -0300
X-Gm-Features: AQt7F2oTZAZWuMjojOHnjXaqW8BZV5e8hCcl5jwgOFXUQvGXspEZdrVGcs_rUC0
Message-ID: <CAA_5yovhfk1qtshNxjcJnu0CgQUk_89rfOBJiwQgc77n3mhFGA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 2/2] opkg: upgrade 0.8.0 -> 0.9.0
To: raj.khem@gmail.com, jose.quaresma@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: ecordonnier@snap.com, Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDE4OCBTYWx0ZWRfXzgyFsnlhka7p
 xriBHQPqC0uaIEMtOFrxeKZyo/pQ40/YZNs07RwEtERio1xSyCog63qVdtHReqoZNq4k5ABocLB
 QFtIV22DoRBTOp50VOjo+gm/KznjEkStQ3EvKO9Tvp0oYz7OX1Txkgq61/Y6yPn8W9Rgac0zQ/V
 k7OwOXlVsPWU2h6daFOQRPhNna/iq/Ck0Yji0QUEm9UppC1fIH/0qRV+YZZvVIo35K8rznF1P5k
 Hvh/Sg0mYg3vakAerU8ywRAUndRcLqG85RZsq70VtkIGgYD/+qEXKAy0a1yVwljWIfC8sgUqmoW
 Lup+4qvkXE3Uw+GPvVq23ahmwwmB9qMvbgRhf5XNE01+AoxAtuhreMIOdwX3Wd5xrP9bxUv81+G
 qClfHheeFDe397AcoXTo7AqsFrkgTyUlpDlIe7oTf4iOOzfXl7vWD8VhBCxkJs7dACinR1o/CMj
 La+OWxT4kHLFhjauC9Q==
X-Authority-Analysis: v=2.4 cv=bbdmkePB c=1 sm=1 tr=0 ts=696192db cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=cQY1VTVnSHTbCtVItmIA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: ghPJ1tgSThmm6mtSH-AxFrok_MhoSR9l
X-Proofpoint-ORIG-GUID: ghPJ1tgSThmm6mtSH-AxFrok_MhoSR9l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 23:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229145

On Wed, Dec 3, 2025 at 6:04=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> I am starting to see the following crash in opkg when building image. Any=
one seeing something like this?
>
> (No debugging symbols found in /mnt/b/yoe/master/build/tmp/work/raspberry=
pi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/opkg)
> [New LWP 34493]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/usr/lib/libthread_db.so.1".
> Core was generated by `/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-y=
oe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/opkg --volatile-=
cache -f /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kio=
sk-image/1.0/opkg.conf -t /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-=
yoe-linux/yoe-kiosk-image/1.0/temp/ipktemp/ -o /mnt/b/yoe/master/build/tmp/=
work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/rootfs --force-postinsta=
ll --prefer-arch-to-version --force-depends remove glibc-binary-localedata-=
en-gb glibc-binary-localedata-c glibc-binary-localedata-en-us'.
> Program terminated with signal SIGSEGV, Segmentation fault.
> #0  0x00007f50a8190d20 in stringpool_strn2id () from /mnt/b/yoe/master/bu=
ild/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-n=
ative/usr/bin/../lib/./libsolv.so.1
> (gdb) bt
> #0  0x00007f50a8190d20 in stringpool_strn2id () from /mnt/b/yoe/master/bu=
ild/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-n=
ative/usr/bin/../lib/./libsolv.so.1
> #1  0x00007f50a818a3dc in pool_str2id () from /mnt/b/yoe/master/build/tmp=
/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/u=
sr/bin/../lib/./libsolv.so.1
> #2  0x00007f50a84fe4ad in ?? () from /mnt/b/yoe/master/build/tmp/work/ras=
pberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/..=
/lib/libopkg.so.1
> #3  0x00007f50a84ff4df in opkg_solver_remove () from /mnt/b/yoe/master/bu=
ild/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-n=
ative/usr/bin/../lib/libopkg.so.1
> #4  0x00007f50a84e9bfb in ?? () from /mnt/b/yoe/master/build/tmp/work/ras=
pberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/..=
/lib/libopkg.so.1
> #5  0x00007f50a84eadb2 in opkg_cmd_exec () from /mnt/b/yoe/master/build/t=
mp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native=
/usr/bin/../lib/libopkg.so.1
> #6  0x00005557220b6a9d in ?? ()
> #7  0x00007f50a8311f68 in __libc_start_call_main () from /mnt/b/yoe/maste=
r/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
> #8  0x00007f50a831201b in __libc_start_main () from /mnt/b/yoe/master/bui=
ld/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
> #9  0x00005557220b6bf1 in ?? ()

We are facing a similar crash quite often in meta-qcom now, when
building one of our initramfs images, but it doesn't happen all the
time, even when building locally it is not trivial to reproduce the
issue.

Jose opened https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16010
and we were able to reproduce this issue with opkg 0.7 and 0.9, so it
could as well be a side effect of another change.

Thanks,

Ricardo

