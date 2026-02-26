Return-Path: <nicolas.dechesne@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C95FCE078
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:10:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69652.1772111435217911701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 05:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oCwM/5Tz;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ToXDR0gf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: nicolas.dechesne@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAL2UY1696118
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 13:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OEVed1yoEnPqGpQL367eIkFl9tZ7MBRxZP7TWJVXV+4=; b=oCwM/5TzoXsV2IAI
	5UXh1W32wuUeViaZ1zHugNyrdL/3XTR72/KcEwlXAo/l9HBoNe59ILouUPItNNt+
	VkGZ/3nVfV4N+/AfaSnGzAXLHKJgvb081/en/LxckVWQHTgbrRJxn7FzHDozL/Xs
	WdF0EyM+Np5Zgr7NqIGNjyiIJx/NZV6hMOKaQ6zMghfLsTGvHc/pxhhWoP1xSQtC
	fb2UojS8csw73LCqyIJZpXN0M6Ayej6/DPJvuHjyuRYQjcRaFAhWfb5IPsDQoBuo
	aJuLOESGrjaFlBaaIHqTngL0BJC1nvwdr0be6RAc1Iz+m9ozJJnyr1dQX5y9ih6E
	gBfA8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350krgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 13:10:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4e37a796so543788885a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 05:10:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772111434; cv=none;
        d=google.com; s=arc-20240605;
        b=k6B+DrF/z6kAEpNXoDfqHg8U2W7FMHCcbVyVR/Eo9KUENrCvya7elx4tb3HFAx6qiH
         Fk05jEHsxtZ7MRiO4QHRS9W3lf66zHPEuNb3k3fZCeu8R0M7cVZeY5M0i/s0QilDrQ5i
         RdER0zX8N9ehZ3uFsqbuYQJd0zgSWC3GoLth48hb4YvWBmmycDb5wSIS62QuER9RVu+x
         CWq0xIcsbY/3gINF9sm7E1eqidA+K357BSpEHf0I0S0egG+Q11h7AOlSfIUoVcreReuc
         Ytz1/3N30nU/Bj9e3qo1zlXSbrACOrZ8FUZ9ubeoPW+pJG5rkwyznkaAO4IoWxs7AhcD
         ryOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OEVed1yoEnPqGpQL367eIkFl9tZ7MBRxZP7TWJVXV+4=;
        fh=7n2AejDI3t7pOkqzjfxtDiQrsHy58Y0naSSatmyuMvc=;
        b=IQD5TswlJiI1FVxZ/3I05yA77qWChVUnqA71LXDjzfZ3MC/XAwrg+Tqa18WMaLu1Ii
         /cMXtrqWwLe4uWkhBsCHiaKiw2t1ucw2Vl4On3mUJp7U9nmfeMAVsrg/2xKcEeRnRABZ
         Bq+QSYrILwhgO+jmyCYJioKatRaNsFwJIfxyOv9lvBICHhI5j+/7A1H30U20jlBKv1Mx
         QeT0x10OHTXNrNJ5I08PMHDYAHSStvgEf4hw5Vphu19DoMANZCDkD+KVBxeCfADyaQcN
         9QxT36O1RAkasWsLKm6kmfF+3cUM8yxBISOtE0+s6jCBrp+pcPjLKpwU6WpL0GWtCS/S
         0caw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772111434; x=1772716234; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEVed1yoEnPqGpQL367eIkFl9tZ7MBRxZP7TWJVXV+4=;
        b=ToXDR0gf2IzdNhmY2mHpF5EjJq7b08IY8JHXyWN/I1BcU14stmpcQMYeQiUeXlHS8L
         BDnrlgXxTvdPbsMKDj234o9WEBAYFu+5oyg6Wx/pzNpUHPwD270o5g2QhC3T3o0nDzkw
         1AxgaGx5D6cHBd+Ub3aKdInxa7dzJgu/YEASYDUo2UAmDd2+zTqTOHKEyfcR6FXn5Ljw
         M8wwyN9Ue0BhHF5UmAcvuopF7ouGTvKH+PqEI0AmhC0Zjes0gAgyGd8msmxo0jCJ/knh
         beK850aCVjFoKcvQEGQ+AZVJieIdJUzICd94BJXtfH3xhnCnMlcgFQfz9A15fU83t7sI
         ZpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772111434; x=1772716234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OEVed1yoEnPqGpQL367eIkFl9tZ7MBRxZP7TWJVXV+4=;
        b=AGdqXo2bebPiqBIKL/UTJoq59I4Cy5jWeFXvIcqb3+cUhOsoW8ciypIKDt5bK6QbPl
         gjhthPYFr/CN5FJKByZun4mCOvMTm4Q7sXaQMjLFVvA3xT/CsUiLRv4mWAXcGnPrV3Sd
         wz+i6LzQNDQr+IgTHJCJEo8pptnBekAEs1ihIdn1SjRiBj4ygiS0a4wwqvcFYf/gWR/l
         46i+4J+uH2nIfQ6qjaF5qQcyfAu7RiMBV++L5aV35oZ50CoFGeJFVfSGbnmd1wgZpLjZ
         EGaJm0/Wr5ghDDVbn7i9YLqAUGo7OmxJtzb/ScN+A4pf+eNwxH3SgH9/+F+eEJYZ0Oal
         uQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCWoK0UZ4CNlSuLG7jTe4iLA7YcY2jzBb3t4x47HQR1yQB2bDXAeuTnz5itR7838Lw3F9R/zMnidmWPA4/jzfHKg4g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxUISFFMILifwmet8FLQfQZyVWVoUMPczo/zmJAo4u00fm1FUyi
	O2r/Pc6JRmZXcRSrjMKh1BlnVu4s/w9uOq236CWvvM4MfWTTMk590YdgTCh68Swmo6tjmvMyxVm
	zjh+zjyr1Ucfdb5zMBn0ddDYASfTF8c8+JMN6K7uvGAeAqKsMkuk0wjKMMPYNnnNCZ8/SNXN6Je
	SgUXgg1LUGHXJMvU//1GzHdyWxYoazd85xONMDbWadoPKQ/JRhoCrSdjeQzFJvdBGQtA==
X-Gm-Gg: ATEYQzwNgxqlqoVEv6bR3kYjVkVKbXmLVKSyidaHBlBtko277OAnNp3Ck70qSAJWvzm
	QnF4QJFoL8bvKzvHEcdD7RhuU4UgAWiw2l0IDA2l8skKWhPys1o6QfkI7RYHRLpQ20otQxkS5Ux
	tWuXdGzlt2dHGtjlA/pt6noXDszWaNrIV8DaxJa85A3InW9ItKSEMZ3BOvmdVUF0ehjAvso81ow
	09nObSJ
X-Received: by 2002:a05:620a:191d:b0:8c5:38d1:7734 with SMTP id af79cd13be357-8cb8ca80184mr2263127685a.54.1772111433569;
        Thu, 26 Feb 2026 05:10:33 -0800 (PST)
X-Received: by 2002:a05:620a:191d:b0:8c5:38d1:7734 with SMTP id
 af79cd13be357-8cb8ca80184mr2263123685a.54.1772111433041; Thu, 26 Feb 2026
 05:10:33 -0800 (PST)
MIME-Version: 1.0
References: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
 <CABWbsgD=OF0G4kXyGCDCSByVrd0u4jnxHQipFjdLueoiv-99yA@mail.gmail.com> <5b7f9fe72cb1863826c7a7757c90eab97853f134.camel@linuxfoundation.org>
In-Reply-To: <5b7f9fe72cb1863826c7a7757c90eab97853f134.camel@linuxfoundation.org>
From: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 14:10:22 +0100
X-Gm-Features: AaiRm52o4N6bZumX1k8xuklXST6f27tz6oEPUjPh6qDhxZveyUcJvg2FJA5YaJw
Message-ID: <CABWbsgBwu32+X4RYM5kzc747qAWs2WWbszo3enTJY=zkxqHpww@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Recipes which should always be
 upgraded on stable branches
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Barker <paul@pbarker.dev>, Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
        "openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: i-Aydbpj58hiBbXXM5m1JeQ3ux3PMA-F
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=69a0464a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=xNf9USuDAAAA:8 a=ag1SF4gXAAAA:8 a=Q4-j1AaZAAAA:8
 a=3N18OTVUDUG9Od-FFKUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDExOSBTYWx0ZWRfX0JlS/RfgqS/t
 aGUC+okvnWXEsRpEKKBPTzWQho6gDHsxnXe/jrJwFS70Goe9IDbDNbuTIhFfxZoNNTeVkAJqBUz
 Dwj5KHrAyj4OnFcdIfbNonHfXeDLj87HifPRRDtmERClBeTQ0RJ7H7g5+ic76x9LUrmjXt3v9kz
 IP0LL37h0iJk7j0sg++cPxG/8zu+iPn1y9AG6ZkTTtQ4BmkR6xgX29vKhl2AXQVH4K9wS0IT7wO
 tSZie9GbKKNnBN6ckxZVrM9g2jbz73mf2BBCn8o7lkaWL0k405MUaQGSnunxcBzX6G5jDHu4Pp4
 /9Srjc0tPlMQkKgrzXpb7STZsdOW3WQOkqxGVxTdIhntn56XV3wfH8iNqPHcRS1Eqhxf+XLqf+n
 C9WyYDzU1+5y0C0QmZZ7YPnqcqEJTt0TkvrvXqIXjHIfzh6MedpnJ1qnw1C1+5f4VVs0Ybx93HO
 C6g45BamW7r1gI5TwrQ==
X-Proofpoint-ORIG-GUID: i-Aydbpj58hiBbXXM5m1JeQ3ux3PMA-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 13:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232021

On Thu, Feb 26, 2026 at 12:49=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2026-02-26 at 12:37 +0100, Nicolas Dechesne via lists.openembedde=
d.org wrote:
> > On Wed, Feb 25, 2026 at 6:44=E2=80=AFPM Paul Barker <paul@pbarker.dev> =
wrote:
> > > I've been briefly discussing stable branch update policy with Yoann.
> > > There's a few recipes in openembedded-core which I would like to prop=
ose
> > > that we always update to the latest version on LTS and stable branche=
s.
> > > These are recipes typically providing data that is expected to change
> > > over time, with little or no code.
> > >
> > > You could say ca-certificates is already covered by the fact that
> > > security fixes are acceptable for example, but a clearer policy would=
 be
> > > better.
> > >
> > > Any policy change will go to the TSC for approval, the goal here is t=
o
> > > get some review and input so that a concrete proposal can be put
> > > forward.
> > >
> > > The recipes that come to my mind are:
> > >
> > > - ca-certificates: To allow access to HTTPS resources we need to keep
> > >   these up-to-date.
> > >
> > >     - Keeping this up-to-date is common practice in other distros.
> > >
> > > - tzdata: To stay up to date with timezone or daylight savings change=
s.
> > >
> > >     - Debian takes upgrades to this on stable branches
> > >       (see https://tracker.debian.org/pkg/tzdata).
> > >
> > > - mobile-broadband-provider-info: To stay up to date with provider
> > >   changes.
> > >
> > >     - The README file for this project says "The Package contains onl=
y
> > >       informational files so it's safe for distributions to grab upda=
tes
> > >       even during feature freeze and maintenance stages."
> > >
> > > What opinions do other folks have?
> > >
> > > Are there any other recipes we should include in this list?
> >
> > I know this is going to be controversial.. what can we do to keep
> > linux-firmware a bit more up-to-date? the recipe in scarthgap has not
> > been updated since it was released. Other distros deal with
> > linux-firmware in various ways..
>
> The challenge is that linux-firmware is a totally different thing.

Correct. And we already discussed that. I am hoping to get more
feedback about the overall idea. Or feedback about how others
typically use linux-firmware in LTS branches, since not updating it at
all seems problematic to me.

Other distros manage linux-firmware in different ways. Debian seems to
either take full upgrade, or cherry picks specific firmware files
upgrade. Ubuntu is stricter and only updates firmware files (or add
new files) on-demand, as needed.

>
> a) We have little idea what the internal changes in the firmware actually=
 mean
>
> b) The liunx-firmware recipe is complex and changes a lot
>
> c) The firmware in the codebase has very different properties and
> change controls, there is a lot lumped together and QCOM has different
> policies and timelines for their changes compared to other vendors who
> have firmware there (for exmaple)
>
> d) The linux-firmware recipe itself has caused all kinds of regressions i=
n the past
>
> Yes, we have done a lot to address d) recently but it is far from clear
> we would be safe due to the other issues.
>
> Cheers,
>
> Richard
>
>
>
>
>

