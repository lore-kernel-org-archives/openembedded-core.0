Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C110CCD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 17:02:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3679.1779210159084075003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 10:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gLfOqxbg;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ikFSW+G7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExFuc1237838
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 17:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOvLWXGTbsZiBqNUzm6wioEwiBBckUftG3H8SnHFxKY=; b=gLfOqxbgd7cbfvqq
	PpaXe/x57AXNKKdU+Xkk6FZQW1HetQLFNtNfYXloIEHbTeTRRkOsUdxt1ZyhrcOE
	3ncvOlo96mbpL0I/V5RA1Qc7pmL8V3Mw8rfMe5WCnlPuRkN+KuZTOqU9daiTmXUY
	Vzraml17DReHvoNsnT5XMDNUV5ikxMwB9BPuN48ypmR+MbKwvvWTYbD4uIarPscR
	LPquWjjAMH+Fb1uzvGm/R2YV6FXCbYMpMIiwD/uV9Vn+k9Brdr6NIb/hxmQarLHw
	8nmiHNeY0M6USRYUgPcgU2maxQZzN8hPO6bmw0yUpMMeOsqRkQBkSSPTHWDX6Lrd
	OeAfuA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3srj3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 17:02:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so5374238b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779210158; cv=none;
        d=google.com; s=arc-20240605;
        b=Q3BGJYSANixShehTSZynilgxiZsH9FqR8bD4gsu5RcnlERR0lens3OvhV34WbKIXop
         9LhhdTgFCNYc1xOBXrcEZZSq/7312dcYNq6M1yCnK2rXPyqDRvTeQK5EjLiXAa7y6lgD
         wDiy/3otHWfvcmN+WGBTgwSDyf9BTy5JreUkaKH6o4I0DSVu/z4za37teu6jZznIXgT/
         VViYT2cfkVakcGDW42n8pS7aweptOrQ3B6qXihLV3gy9i+w+W1mbTfRJ1+jYfOsOc3+b
         yFU6J2ISHHroes0Eagf9FEWrxidv5/FE5W+3uDAR1mvxmb9UXkf8jR3Nq8l2tfRqKnNY
         egeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EOvLWXGTbsZiBqNUzm6wioEwiBBckUftG3H8SnHFxKY=;
        fh=Kbh1YjDJ+6OVuTdAckvyWHamnzITQFyy4fiFsDvBmEQ=;
        b=VJ0X7KlYLm4euY6QMjPMitnALl9QIKL+SrLXTRu+YMS+c2s1IapHJ/U3+J8UtUuLpe
         W8I6xKNESeN8IVp/v6jBpVk09NEA9OjwFG4FLSDSD+DywihHzL42aMXXbNcweOxzbujl
         VV3lC1Xvb2rnemXPOLIr5qSO8SQ1CvrSj+Lr1MCDGpcNES8cXH6FkxFQBaCgWtYxL4Qe
         UcuUVrif+/gUWGiTFRg4AUxRM3gMWGEj2XkiDnpAWp9UT+1R9oWl+ep1dTJOH9YMx5gr
         SBKDNhXaoSrqreUF2NLNDlm0xhJCUehjReK0ldTSR/Pgwu8pH6imHsaRhwzernqhSLhd
         9Bdg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779210158; x=1779814958; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOvLWXGTbsZiBqNUzm6wioEwiBBckUftG3H8SnHFxKY=;
        b=ikFSW+G7fNexv/fJ1Uemf54+sPWvFrzzolPeZtmQpzIlnlBPWd5qUbCHz7T1bhNPCN
         4dTLGsXmPSh/FeZyNV/1LAIqisbWRkgOHszFZVB4TkYYmqLSt25YVAqfmrcxYKhi5g88
         p7FyAELLloMWcFyku6TOt6cZbafol4B1R3pAElWucS8uH82ijFbrj2XvwMEa/IG7bb/4
         Z9y3eiW2b0XMHhj4TXdLroF1KHlvBa5XdoePN3nMQF2tF3pCf7g5lS3NXNRONsSRCMw2
         59S3n8849qrYOSudfxa1y4HMomZjAHz84M4MoJXU8y3v6lftWibmyxd8QPwV6gNUrSOX
         hVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210158; x=1779814958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EOvLWXGTbsZiBqNUzm6wioEwiBBckUftG3H8SnHFxKY=;
        b=hWnRE6Zhz+yhDvsWJEkRDYW8PT33ox5zWMt/mwxWSJnMVweETSPskGIFr3m1BLj7RO
         CLrYf/n1rVjvd1vGjCrtQMh8HHz21zC/57nYyBTtLgCCzxNZsZpQRkmnfXrp4F/2wkxK
         4wZGRfz/qjq2X6vRB5olJ7saRvzc7hfygHtuRYFEPh4W3uFXgv/I0hPXSFsCDzw5tmpb
         Kx6k0NwzH1xS4y/PntSPbHUJSMwvUz++jgRA9qqV9KBQo8wVYSTUApjYUAIaWDqY80rU
         qBQl4bph46+iYPTrqdeeJjbqx2CJhzM5T4cN1YOmqF6DhzCl6RPO82zgcN+ONTh0dw7g
         kDdA==
X-Forwarded-Encrypted: i=1; AFNElJ9QyUgEDw6jyZfuSjBVDB1dvtCdJH7kXgEMZIMWQ/4MKKo79zsearBi4LEJUegHlCedCOjlzAOyLTcFLmDDnMeLHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyN5d6MNC7gPS6t5VURhu0+DIwCxKlIyi95CMNqdRQUgzrvT551
	ByAKGnHk5JF7XtNLgUHtRa26+u5GqSNTDPRl5zmHvmtXQpYulyVW4I92KeGxnAcW288v6n1rZJC
	N3fOhFphrqSQIkp5yB61VOCom9Tfoti6kMvKoxSLlDv7FgMVeRWKOlaZCfAvYKXZ1nJm/aFwaR5
	5E/WrMp1q9aAqSUENx/n4NrzYZlu4CkrC8d/f5wiAApisqpjKsTzwpfD/qUg==
X-Gm-Gg: Acq92OGk0rNyGBFAMRSiFkjCL10G7B6IcOs+fEp9uD8gBGSwUqmKDHuMw3m7W6Raa2+
	ZOGyT0fxCSgiwznCuwyWL25wkobRm67XYFcdLj+jhx4qQjTLMS7PIxYm9/WxjQYVDSU5drGY9oR
	Yd1E62lKWizfYcHF6KxJWJ1TiMIi7D/NiSLmnRDbYRnlHcbafxpbq4qnJBOBPTb2XVgfaqyQ0VZ
	j32
X-Received: by 2002:a05:6a00:c93:b0:81f:3fa0:8c38 with SMTP id d2e1a72fcca58-83f33b4d8a6mr21064137b3a.20.1779210157655;
        Tue, 19 May 2026 10:02:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:c93:b0:81f:3fa0:8c38 with SMTP id
 d2e1a72fcca58-83f33b4d8a6mr21064074b3a.20.1779210157125; Tue, 19 May 2026
 10:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
 <gnsndbzzgdnp4q5bqmccwxy5njtkj22btgpedstktykczupbfk@chm5coxohwxo>
 <f531466a-fbd8-472b-a2b1-e487eea6d51a@bootlin.com> <9dc8c3b7-c358-4a7d-af1a-c1aec83906af@rootcommit.com>
 <e8674aa9-a98b-4d39-bc9f-a525516d3c24@bootlin.com> <8fb4098a-0831-44d5-a852-3759d59f2433@rootcommit.com>
In-Reply-To: <8fb4098a-0831-44d5-a852-3759d59f2433@rootcommit.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:01:59 -0300
X-Gm-Features: AVHnY4Jg6Y0ZuE91KfWISDQtOZHnMcE6qWUMqSLBFv6N3IXee_hAAPddXvIsi1c
Message-ID: <CAA_5yovGUPcCN1KE4ZzCY03amL5vKOM0f1P+78ntaqr3MKhBPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: move DT validation yaml removal patch
 to common SRC_URI
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
        dmitry.baryshkov@oss.qualcomm.com,
        openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: CzaMn0gKbElrEtILHfgD_oXUe6F-Yfub
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3MCBTYWx0ZWRfXxcRDlahW4qhK
 1cPNY1QB+UAeckyO8NNsfmrDQcD+duyt6nmcXG+SyAVkNRKtFq1gTuitTnD/WmCRKDD6xDaHgYg
 PEck/v+CaAt0bruVzOl4q27o+Z7NNRDeHhJ2lw5u74T2Gd17IgfsseLP2+VrP5yJfGg6HK1JM2U
 NvlRkS3Oxwky6rX8SuY2LH6/IKmJkdKSc/jxfehY7S1vKP9nuBimaZt5TdFTxZkPzc22EdDlFip
 vApIbtKKJYNNNw8FwwT0aLdnGoefMe5y5UsfK4A5rz+Oys7D5fQ8JlVcVpIJtlIXdmlsgPIgnyU
 VqUEEr8N/tHcfrWk0S7Rr7H8xEDD8ofIF5CO+1keWLKejVDZJGH8f8K9nwcZ2+lAMa9/ROXwYvn
 XQwGgRZ6a+sWtd7TS9363eURBAvmUnyE5ExFo2rvbrHGDt+E+BoZkeHrrYH0udjFtI+HQ4NUDFv
 TvRR4foV5NsEM3Ugw8w==
X-Proofpoint-ORIG-GUID: CzaMn0gKbElrEtILHfgD_oXUe6F-Yfub
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0c97ae cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=d70CFdQeAAAA:8 a=RftuLVJsNvvb_EBJdFYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=NcxpMcIZDGm-g932nG_k:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190170
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 17:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237336

On Tue, May 19, 2026 at 1:29=E2=80=AFPM Michael Opdenacker
<michael.opdenacker@rootcommit.com> wrote:
> On 5/19/26 1:59 PM, Joao Marcos Costa wrote:
> >>
> >>
> >> Any update on this patch?
> >> Building u-boot-tools on master for the "qemuriscv64" machine is
> >> still broken.
> >>
> >> For people facing this too, a workaround is the add back
> >> "libyaml-native" to depends in meta/recipes-bsp/u-boot/u-boot-common.i=
nc
> >>
> >> How come the autobuilder didn't catch this issue on one of our
> >> officially supported machines?
> >> Cheers
> >> Michael.
> >>
> >
> > The same patch [1] must be applied to u-boot-tools' sources to fix
> > this, rather than adding back the dependency.
> >
> > That said, unfortunately I don't know what is the current status of
> > Ricardo's patch, nor how come the autobuilder didn't catch this issue.
> >
> > [1]
> > meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validati=
on.patch
> >
>  From what I understood, his patch was rejected.

It wasn't really rejected, we have basically 3 options to solve the
issue, and the one I decided to use was basically the same one we
already had before here, as I believe adding another common file or
duplicating the patch line just to reuse the common file is not really
that great either.

But I can send another version duplicating the patch line in both
repos, if that is preferred by everyone.

Thanks,

Ricardo

