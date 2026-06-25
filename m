Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A9FCDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 03:47:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3914.1782359238503523525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 20:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ipnmtfM5;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=i0Da2avo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3dxC13405650
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 03:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AmaIKlRQu8e
	+J9wEFzq2UufJsjd/PENRKFXha4rO+OE=; b=ipnmtfM5Va8lz1D1GLPFHDQK7UW
	Xi5QKPOnDbV4isMrLz8Bs+PK/QoOD2vgXlkTkb7vZyk23YobsoV42z/HMeL2Di8G
	GC20R7En/GMqA0YWJwQ5IkFO4njmt1BcbjiLgZoh3cepUmL91dZTpW5goHzJxkRc
	lzK4rjt0L2xUlbhtscAEiC/eko1Ac7XLWNKN6ocdzDs43QPjvC9U4BKgah8Tl70B
	vlwMnNK3ppadysYozTHBjugR7nakGFuXUZrGSF6EUP4e5uT6TPuOHkcgFxETkvxo
	LbmXrte899kTztSHWckvfQUdyRDSY7+ZjE+KPc3aFdOcxtyxNt1SYtFrzmg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0tsprhh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 03:47:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1399a989312so269620c88.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 20:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782359237; x=1782964037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AmaIKlRQu8e+J9wEFzq2UufJsjd/PENRKFXha4rO+OE=;
        b=i0Da2avorM3wb3y2rKJKvEL0BIaYkHaK3iUOhvnTrAY4XFlz88DWf8JOccOGFE5Z7i
         HlVk9F7hR6jhHg1gbU2OyzMerPTgglMXJdI+WbGE9H4kaRj/LsSsR9Mez5m0FFkVp7E0
         FHZ2XliC1UeRTsBGjZryDZKFq7ZrIFiZdybNzqENAU1J+MS7FH6liZH57slYVx1ZaiGd
         39RhJ08pMqY86+Mvb14kz5f+OxJw7+b3exkOav53Taq2znoG8z/1rfPmVJHw6CqIDlTT
         KV9iQ+4gjZiVAa+tPbKjHohKP6mQC7vfjieqCX/fwZSxGecdY6nZxYQOUNbhhDSaeyl2
         iXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782359237; x=1782964037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AmaIKlRQu8e+J9wEFzq2UufJsjd/PENRKFXha4rO+OE=;
        b=ZlTzOZ18FTyXKHmXmWT8aMix+RNsM91Upo0Dgzmqi5dSfymidtm+m2A+fePWgHd3pg
         h7OK2WqFyV/vDaYreSoBJJMZ0/U1AzEJ5z+izZq3AphwECmHwHglmsgFN4Dkj1UvDOiy
         +4jZLoXbo3JusbYeFXif8FaXHVnMFdeg+dg0BgWhdGDIB9w48PONY46hhQa8CUp1PsYT
         Cph65T9ITOj51PXVM+Rn18mdPQKoe7mGCOv838/bcqmPl4DiPpDnv1heMYkpOIRXo2nE
         zMPbxPz5RAdhkrDWDzTMXY3pg3dha15Wec/KDcWOaM7dURPuK6vFAxFdcGdkR521+6pZ
         sJrA==
X-Gm-Message-State: AOJu0YzIaRVtJNQIzc/qdQCa0Nio0O0GgowRqQ1yYt+typXiC8vSfMl6
	FV3Fi6TRqjwKvsTiGABuy0vPSARkysI7IlipixY+PqBSp7Yr9N3e0Jny8a1+cwUCwO1dKpMGcP6
	mT51eBOE+zixb+yvovsfM2XaFjXsC8mbIPYElqpTEHdLRR7oqumSihliAgBygi0qdb9+NgZ7hbS
	LSRhSPs6IF8nRA8spxOA==
X-Gm-Gg: AfdE7cmrNGRP0YAC0Zq6KiD6NSjp0NEBbF4PqMUz9MZXuRa55IYjy88EvOm+3IhT56M
	tr3zlA7E6dM8oKCQGDj/nirFqaOlAhJVt5z8T8DiDcRkuhobO7O0A9hp5ybIyJu/zU9ADQ3VrVU
	eIE+DlCHxJURCISYSQcgaF1UAHucGGijmLZ733eO2uCocUzC2Qa7Io7dXWKPxWP6F9H2zd+FwjN
	2kgf49nSZHnAqWWeUxXcCBIOseVvqm+AcM8M27bRgh6Mm2H87NBOnKUTAlCiVoH/L6Pm0gPkQBc
	n9dRcARP95a95hiHhrNqgPEPxtRmCFsJ38M7Cyq0XKazLppEJOop+Li9P2MoxqF/twOxMmfdD4S
	DAyV6KeGDcB1c6aUIh0AwKAKDIv08W1ZxLrBpn2SQeBhIRCGIGDRQ1svj1a08JQ==
X-Received: by 2002:a05:7300:e82c:b0:304:5074:83b1 with SMTP id 5a478bee46e88-30c84d1d771mr334963eec.6.1782359236827;
        Wed, 24 Jun 2026 20:47:16 -0700 (PDT)
X-Received: by 2002:a05:7300:e82c:b0:304:5074:83b1 with SMTP id 5a478bee46e88-30c84d1d771mr334945eec.6.1782359236169;
        Wed, 24 Jun 2026 20:47:16 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c6c2sm3636933eec.10.2026.06.24.20.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 20:47:15 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: Re: [PATCH] bluez5: set L2CAP IMTU for OBEX profile listeners
Date: Thu, 25 Jun 2026 09:17:12 +0530
Message-Id: <20260625034712.3878106-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605024308.222721-1-wei.deng@oss.qualcomm.com>
References: <20260605024308.222721-1-wei.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OL8XGyaB c=1 sm=1 tr=0 ts=6a3ca4c5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=BpvftRgChdhiQIXlemEA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAyOSBTYWx0ZWRfXw1vpTCuJDIA2
 IweG9amfwdEKv/V0r4WmIvz0CngVcHJlh1/C9pPfsQ2g2TmWhArhAOFz30ikntSatpfqg6bAt8a
 c/rysO84bj/WBQlTeNz4s/RU8XSV2a8e2WTfW1QCJ7MTRwK7r8daHdvLOObZd0GUikcO9rc/pDn
 AXBsTt4ZEW/nYCpCujM5uVQ6GJUfLwhxZlGIH20klLbAqxzI5/ds6JYzPwMlVzM0k4W7fLBx62i
 bChhT9haNszGzCnF/fP8Q1xtwNnuXODVFADI5MYY4wW6fQJfN8xvusZyV5FFNV9TPhlUoxElz9t
 HU1EQdd0abq9FVIVQFxDY7BddGtn1wUQV/6sC7lERMFNKhgILhuxn3G3YbU3Wexh+SKA124J+XT
 OTXgkc+j8kfZia/NtjqCxgtHTeRWNvFmzRt38+lGT8iH4Ym84ytJWLzFbSl9ZG3iaUCcFbHa/Ax
 JxEsv4NCcXlBcoKu1DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAyOSBTYWx0ZWRfX2nOI3q30Ev/z
 PymuFtXAVneGM3yeHrhI3+ifNMXPfEIHLE1GD04iDCXjup9sfcezH8IcKLVW1+3Lai+7G2G3tbi
 SQLb4duqc4bnB0NtI2m1XuJQUJnPRF4=
X-Proofpoint-ORIG-GUID: pR87zByPFhKShIQQX_Z-s4phX0JGlf5Q
X-Proofpoint-GUID: pR87zByPFhKShIQQX_Z-s4phX0JGlf5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 03:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239534

Hi Yoann,

This patch was merged to OE-core master on 2026-06-11 (commit 13cb97f).
Could you please cherry-pick it to the wrynose branch as well? It fixes
an OBEX Rx throughput regression caused by an incorrect L2CAP IMTU being
advertised on listening sockets.

Thanks,

On Fri, 5 Jun 2026 08:13:08 +0530, Wei Deng <wei.deng@oss.qualcomm.com> wrote:
> Backport upstream fix that adds an imtu field to default_settings for
> OBEX profiles (OPP, FTP, PBAP, MAS, MNS) and applies it to the L2CAP
> listening socket via bt_io_set(). Without this, the listening socket
> advertises the L2CAP minimum of 672 bytes in L2CAP_CONFIGURATION_RSP,
> limiting the peer's outgoing PDU size and degrading Rx throughput.
>
> Upstream-Status: Backport [bluez/bluez@646014a]
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

--
Best Regards,
Wei Deng

