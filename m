Return-Path: <jose.quaresma@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E2CC79FA0
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 07:39:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2044.1788853176353617542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 00:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=L/gV7erw;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=aP4p7RiV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: jose.quaresma@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M4hr2712506
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Sep 2026 07:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qkmho54w4nKsl58DZCI2DR9N
	OTeIscM8wClsboG6ATI=; b=L/gV7erwqiZwO4PuuJd7F48zKojZdx0m631xWXvh
	Suq79LjXXGCnlgzDcuOlTGfuUjEGXcCcD1aaz+M1cbxISZIC66dMwfhKiXu3kYiw
	O/thm1kp1bQ5mzyBFMyCi8KMUGab5rQuamplrJ0I59vnGEZdapZRKrA/FvblAfb3
	EiuFl01VFp9bq4bBPutoPK9cCRfwzAxWw2vmo/1rprMnuJPP7Zw2/XkqC7D3vUYv
	K7+bZJNXONEgMWJi+RX5aEvDFNMYLvYFHbgwPTdE8DjnyLphjsQQBAb5k974CfnC
	hl9NMkjrZgTMXY3P03aWReIQ/R6uGCe3I3Dc9IJjGvHaSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqm3bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 07:39:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso885975585a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 00:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788853174; cv=none;
        d=google.com; s=arc-20260327;
        b=ML0fomHYdkd7W6OpvUah0QRU29ox2SbClMOkSdDwoVlUaUphEuxY41ON3PInCOOabZ
         3fm6ZZnypf1Ar2tmXNz+PAcZYohGzsf/wytofj1xlgaOkmxFWHSFXMGhU2oBLrGsoCG2
         cICN8PZhwaecLR37AjCLGBpEMh6ro6D0AKSuY1a/V9l4eLY7ZPPauXT2aIZaWZBuWL+L
         vO31JfLOTfozFVFAuC+h5z63kKRAcRoA9Ntq/RiAoAilL3inMBZ93xG3d30RLjizxuf6
         g0N931yI2LFm3GQLCJHNFDQnoeIlB8MerPFG2hS1SxlXBm80c687glnx06liVzMzuZY/
         PNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qkmho54w4nKsl58DZCI2DR9NOTeIscM8wClsboG6ATI=;
        fh=jLKJRgDsj3HkaCf9kAszo4XGtKUcasi4UwuUOlo7+hg=;
        b=UUkebgl2HZLL7zPXCZzq8e7EYmKBRmuRYlL0IISEHws1bvSkktSYNyOvViuXl8Go42
         3k8YXQ8DCFksghFWsMQcaHewW5zr5D5Xp1ldOio7uZ81lfMijoGRQsZzSv5+zDDiSiNl
         5xG1Ai20QH7vq5vK7BAJL9JkTprX+2/bq0WKwBUiIpcvpO5MA9sMZd843ykZ7vigzgy9
         wP2nvV9EBh/HNmqsZFRrrPOJbBzE8ZoLftdHEV9n0oPnjsInVntVeq9RlvpqKRSdJBX4
         qFn5+NIwnvvuV/TlZtgLaO7/aeM/HTSPS1bJkfoqP01apqUEIL5qP1kiRPpVm/TtSV/O
         nH7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788853174; x=1789457974; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkmho54w4nKsl58DZCI2DR9NOTeIscM8wClsboG6ATI=;
        b=aP4p7RiVUB1WVuGOVz7EU1/Om0wEo0aKgTt64QrmPMluWuob0ooIQcrW1q93GU2+AV
         O52hQvwBPar6KOqy//DJ27T0wMaFZq/To9FsWwIxY9GBumHtWTR4Mz9y/Q7KLzTYZReb
         0Szne6Zs/QIalckhkljqNSJ7XYrw6uBxWHO6G8aNX3ASEzmLaqGoGkXUs4Ug3TzgDhAA
         NyPXc/TFnZDrmDttPicRbtUAfkVyfAkDCPHxN3d/utyPOSiwJaRdI+M07SwowsdYPNMD
         UySAIwQwOy7DQSiKsLXJGGJbBhefKwL2qpzf+AReFzCFlrEXCByyFFoaqXfRrLLzT5fC
         3c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853174; x=1789457974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qkmho54w4nKsl58DZCI2DR9NOTeIscM8wClsboG6ATI=;
        b=WaIyXCL+XyAJZOEyEYLjhhJGhw8Z5DML2afWnAoytZmb+lzIL1fHQQJysR1eoghw7F
         CQeoSH1tUou2BOPQ1d4xVOg/PQbPr2WBFhpytaJS3JiLVl2LJeTowgYjWJ2eAB4RAHq0
         9AyW+mNqzTbkr4g09TWJVO8kyEtx5KqtNzNccO1zMrgvOO7Wvydm6rijr3aMvOGfuMU0
         GO/Ziw6TG3dlUI9eCdSP21wBK+zYVA49SM/LhsrioQ2NojQZDeDGioZo4/nd6HrZfpDZ
         J1hLKDiScdi7Pb/ydq+POsqluVHsl35bvcqW4usS7M8uf4jF14GRPrk6bp4ZG+HKyG1y
         eLZg==
X-Forwarded-Encrypted: i=1; AKwUvBwBJphtNPY790yujkE8oBCTb7JPdFjUtpUt7QD0nu7B2kEeRYS+Ik+1MW97N6X3KUOjGR8b/L/JToAUjIdQWtB2Nw==@lists.openembedded.org
X-Gm-Message-State: AFuF++mgzezrzV3UDMKmBddFyM44usSlj8DsNIKtuEBfKm6qAwi6KqN5
	jLUv8+TAL50RMYLMAqaFTxwrG8lqVDBPcUHFSODFVmfyf5t9ftprQlwl85ftN1bgATMOu6FzPr1
	18SeJtP80LCVl47DbPrHVyuhdz8HC6PihJARn7XEwSTOe6QfLMZ6/VYJGewpc3HEbRi8X1OkE+b
	YB1w+w4Lg6Yv1eLh07JD+bBQahEjPzMRz6sQTtg3DsX/pbpECFbLnkkMIbhA==
X-Gm-Gg: AYBFou2O1ONZ/ZoojJ7JeRYcZTFw+/sb+tBxbAZxzbMCF8PPQ375aNn/YA5nk/SorId
	okuHjaIEMn9DM4Bo0+gIu4MXi4Xjh76RLBayJ88VmKN2OQNQ9woXpdxwkYJsm91BlIRD1GpqVw3
	XkJXeZtApRNhe34fr8eqqJo96faxIL8JQDMFUyG0LAzBqrEINEIpKtSvcFRJk=
X-Received: by 2002:a05:620a:1d01:b0:936:dfbf:85b0 with SMTP id af79cd13be357-9398070ffccmr2869054485a.35.1788853173907;
        Tue, 08 Sep 2026 00:39:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1d01:b0:936:dfbf:85b0 with SMTP id
 af79cd13be357-9398070ffccmr2869051985a.35.1788853173394; Tue, 08 Sep 2026
 00:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260907114507.294436-1-HimaniRamesh.Barde@windriver.com>
 <DL9QO37EJTBL.1CBZPRPTN8QNP@bootlin.com> <DL9QP1CJD4I3.1CD0XIMDCNH2N@bootlin.com>
In-Reply-To: <DL9QP1CJD4I3.1CD0XIMDCNH2N@bootlin.com>
From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 08:39:22 +0100
X-Gm-Features: AcwNN1W6Zzvw9gxCqimeS8dGLTqWGoaCLNVzq0y_wgR6kbRAACS82mZmWmlcSy4
Message-ID: <CADWMC-bdA0HOzmOUv7s-E1eLOqOFcTPQ8y2iiH2oMov5WSdYJQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] systemd: re-enable ptest support
To: mathieu.dubois-briand@bootlin.com
Cc: HimaniRamesh.Barde@windriver.com, openembedded-core@lists.openembedded.org,
        Randy.MacLeod@windriver.com, ross.burton@arm.com, raj.khem@gmail.com,
        richard.purdie@linuxfoundation.org, Shiva.Komati@windriver.com
Content-Type: multipart/alternative; boundary="000000000000f4b397065af3d512"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX0kE2hYDMDVI8
 wvZMPhjuZFH+Fotv1QKLiNTWjxd2ttT/qRRC5XpMeqbXUExYySReQdPeWAZHt/Dimi0oqpQEAxh
 WKS64Cv3ConCY6ChwtVodISHUQvWPb+clmH8JzC+UzkMoipGNTDo9Xr1sX/2hl49h9tRb2mj85O
 F3pITweobRTu5pmuooyumWsHVjqc/YuqxKPRUaK+9X68DWHXvafntX2dLfoKnF+08aD/jFDx9y0
 V2sveN2+VusnjJhZ2HfbUFclQ6c8Ri2JXBRRsh3ylZlO5FeDADdWvdIB5nrvnfQ1YyOqyglM09+
 zg7sLW5X+3/EVrcEOesqBcu6llGIzuezORwHGJEwennSqgp4ndroV9hnvZKQp/a93Wf3cojtA8h
 B6/TCXa1QtJLAvwbAbJvWNor3HuwjXnxG7euF0at0Yz5CGAGXaX0MlsFkCJBPXB64n+LFDJFxC6
 meTvD6isS4d4nG6TCSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfXzZaOPs6+yvMW
 WlKQ5s4xp0ay+gef9vKRaOUYEpF+cWaBT5VqC/yemlVgncRqnjPew2X+8yPLCLxQbRp0MNYrrGO
 /1/VlZIpavW7ceFY6m1+RP4/aOzdapM=
X-Proofpoint-ORIG-GUID: fexVYFmnS9jJlxhJA-2POPr2U2G1jZQs
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9fbbb6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=EUspDBNiAAAA:8 a=S0YxG4SEEgtez7jgru4A:9 a=QEXdDO2ut3YA:10 a=Fn0qos2mAAAA:8
 a=WTjZOAMuaw5Htbr0DoIA:9 a=HR5VnpjLq8i-dWKd:21 a=lqcHg5cX4UMA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ABD401rv0trDi8FLFxkz:22
X-Proofpoint-GUID: fexVYFmnS9jJlxhJA-2POPr2U2G1jZQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 07:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245334

--000000000000f4b397065af3d512
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 8:00=E2=80=AFAM Mathieu Dubois-Briand via
lists.openembedded.org <mathieu.dubois-briand=3D
bootlin.com@lists.openembedded.org> wrote:

> On Tue Sep 8, 2026 at 8:59 AM CEST, Mathieu Dubois-Briand wrote:
> > On Mon Sep 7, 2026 at 1:45 PM CEST, Himani Ramesh Barde via
> lists.openembedded.org wrote:
> >> ptest support for systemd was dropped in 2018 (commit 906230a73b3c)
> >> when the recipe switched to meson, as there was no easy way to install
> >> and run the test suite. Current systemd and meson resolve this: the
> >> meson 'install-tests' option installs the unit-test binaries and a
> >> run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and
> >> run-unit-tests.py already emits PASS:/SKIP: results per test.
> >>
> >> Add a 'tests' PACKAGECONFIG gated on PTEST_ENABLED that sets -Dtests
> >> and -Dinstall-tests and pulls in python3-pefile-native (needed to buil=
d
> >> the boot hwids test). do_install_ptest relocates the installed tests
> >> into ${PTEST_PATH} and drops the mkosi/integration-tests harness (whic=
h
> >> needs a booted system). A run-ptest wrapper drives run-unit-tests.py,
> >> and systemd is registered in ptest-packagelists.inc.
> >>
> >> The test/units integration tests, which require a booted system, are
> >> out of scope here and can be addressed separately.
> >>
> >> Verified on oe-core master (261.2, qemux86-64): with ptest enabled, 34=
2
> >> unit-test binaries plus run-unit-tests.py install into ${PTEST_PATH} a=
nd
> >> systemd-ptest packages cleanly with no QA errors.
> >>
> >> [YOCTO #16386]
> >>
> >> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
> >> ---
> >
> > Hi Himani Ramesh,
> >
> > This is failing on the autobuilder, as we are running ptests using the
> > poky distro, but poky does not have systemd DISTRO_FEATURES. I'm not
> > sure how we can fix this, but we might need to hack a bit.
> >
> > Do you know how it was working before it was dropped in 2018?
> >
> > Thanks,
> > Mathieu
>
> Sorry, I forgot to add the log:
>
> ERROR: Nothing RPROVIDES 'systemd-ptest' (but
> virtual:mcextend:systemd:/srv/pokybuild/yocto-worker/qemuarm64-ptest/buil=
d/layers/openembedded-core/meta/recipes-core/images/
> core-image-ptest.bb RDEPENDS on or otherwise requires it)
> systemd RPROVIDES systemd-ptest but was skipped: using DISTRO 'poky',
> which is missing required DISTRO_FEATURES: 'systemd usrmerge'
> NOTE: Runtime target 'systemd-ptest' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['systemd-ptest']
> NOTE: Runtime target 'core-image-ptest-all' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['core-image-ptest-all',
> 'core-image-ptest-systemd', 'systemd-ptest']
> NOTE: Runtime target 'core-image-ptest-all-dev' is unbuildable, removing.=
..
> Missing or unbuildable dependency chain was: ['core-image-ptest-all-dev',
> 'core-image-ptest-systemd', 'systemd-ptest']
> ERROR: Nothing RPROVIDES 'core-image-ptest-systemd'
> No eligible RPROVIDERs exist for 'core-image-ptest-systemd'
> NOTE: Runtime target 'core-image-ptest-systemd' is unbuildable, removing.=
..
> Missing or unbuildable dependency chain was: ['core-image-ptest-systemd']
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4482
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4509
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1157
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1137


I believe this can be fixed in
meta/conf/distro/include/ptest-packagelists.inc with:
${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}

Jose


>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245333):
> https://lists.openembedded.org/g/openembedded-core/message/245333
> Mute This Topic: https://lists.openembedded.org/mt/121127018/10043485
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jose.quaresma@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f4b397065af3d512
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 8, =
2026 at 8:00=E2=80=AFAM Mathieu Dubois-Briand via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;mathieu.dubois-briand=3D<a =
href=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue Sep 8, 2026 at 8:59 AM CEST, Mathieu Dubois-Briand wrote:=
<br>
&gt; On Mon Sep 7, 2026 at 1:45 PM CEST, Himani Ramesh Barde via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> wrote:<br>
&gt;&gt; ptest support for systemd was dropped in 2018 (commit 906230a73b3c=
)<br>
&gt;&gt; when the recipe switched to meson, as there was no easy way to ins=
tall<br>
&gt;&gt; and run the test suite. Current systemd and meson resolve this: th=
e<br>
&gt;&gt; meson &#39;install-tests&#39; option installs the unit-test binari=
es and a<br>
&gt;&gt; run-unit-tests.py runner under ${prefix}/lib/systemd/tests, and<br=
>
&gt;&gt; run-unit-tests.py already emits PASS:/SKIP: results per test.<br>
&gt;&gt;<br>
&gt;&gt; Add a &#39;tests&#39; PACKAGECONFIG gated on PTEST_ENABLED that se=
ts -Dtests<br>
&gt;&gt; and -Dinstall-tests and pulls in python3-pefile-native (needed to =
build<br>
&gt;&gt; the boot hwids test). do_install_ptest relocates the installed tes=
ts<br>
&gt;&gt; into ${PTEST_PATH} and drops the mkosi/integration-tests harness (=
which<br>
&gt;&gt; needs a booted system). A run-ptest wrapper drives run-unit-tests.=
py,<br>
&gt;&gt; and systemd is registered in ptest-packagelists.inc.<br>
&gt;&gt;<br>
&gt;&gt; The test/units integration tests, which require a booted system, a=
re<br>
&gt;&gt; out of scope here and can be addressed separately.<br>
&gt;&gt;<br>
&gt;&gt; Verified on oe-core master (261.2, qemux86-64): with ptest enabled=
, 342<br>
&gt;&gt; unit-test binaries plus run-unit-tests.py install into ${PTEST_PAT=
H} and<br>
&gt;&gt; systemd-ptest packages cleanly with no QA errors.<br>
&gt;&gt;<br>
&gt;&gt; [YOCTO #16386]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Himani Ramesh Barde &lt;<a href=3D"mailto:HimaniRam=
esh.Barde@windriver.com" target=3D"_blank">HimaniRamesh.Barde@windriver.com=
</a>&gt;<br>
&gt;&gt; ---<br>
&gt;<br>
&gt; Hi Himani Ramesh,<br>
&gt;<br>
&gt; This is failing on the autobuilder, as we are running ptests using the=
<br>
&gt; poky distro, but poky does not have systemd DISTRO_FEATURES. I&#39;m n=
ot<br>
&gt; sure how we can fix this, but we might need to hack a bit.<br>
&gt;<br>
&gt; Do you know how it was working before it was dropped in 2018?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Mathieu<br>
<br>
Sorry, I forgot to add the log:<br>
<br>
ERROR: Nothing RPROVIDES &#39;systemd-ptest&#39; (but virtual:mcextend:syst=
emd:/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/layers/openembedded-c=
ore/meta/recipes-core/images/<a href=3D"http://core-image-ptest.bb" rel=3D"=
noreferrer" target=3D"_blank">core-image-ptest.bb</a> RDEPENDS on or otherw=
ise requires it)<br>
systemd RPROVIDES systemd-ptest but was skipped: using DISTRO &#39;poky&#39=
;, which is missing required DISTRO_FEATURES: &#39;systemd usrmerge&#39;<br=
>
NOTE: Runtime target &#39;systemd-ptest&#39; is unbuildable, removing...<br=
>
Missing or unbuildable dependency chain was: [&#39;systemd-ptest&#39;]<br>
NOTE: Runtime target &#39;core-image-ptest-all&#39; is unbuildable, removin=
g...<br>
Missing or unbuildable dependency chain was: [&#39;core-image-ptest-all&#39=
;, &#39;core-image-ptest-systemd&#39;, &#39;systemd-ptest&#39;]<br>
NOTE: Runtime target &#39;core-image-ptest-all-dev&#39; is unbuildable, rem=
oving...<br>
Missing or unbuildable dependency chain was: [&#39;core-image-ptest-all-dev=
&#39;, &#39;core-image-ptest-systemd&#39;, &#39;systemd-ptest&#39;]<br>
ERROR: Nothing RPROVIDES &#39;core-image-ptest-systemd&#39;<br>
No eligible RPROVIDERs exist for &#39;core-image-ptest-systemd&#39;<br>
NOTE: Runtime target &#39;core-image-ptest-systemd&#39; is unbuildable, rem=
oving...<br>
Missing or unbuildable dependency chain was: [&#39;core-image-ptest-systemd=
&#39;]<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/buil=
ds/4482" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/61/builds/4482</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/4509" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/73/builds/4509</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/bui=
lds/1157" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopro=
ject.org/valkyrie/#/builders/109/builds/1157</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/bui=
lds/1137" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopro=
ject.org/valkyrie/#/builders/110/builds/1137</a></blockquote><div><br>I bel=
ieve=C2=A0this can be fixed in meta/conf/distro/include/ptest-packagelists.=
inc with:</div><div>${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;syst=
emd&#39;, d)}<br><br>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#245333): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/245333" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/245333</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121127018/100=
43485" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/121127018/10043485</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jose.quaresma@oss.qualcomm=
.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f4b397065af3d512--

