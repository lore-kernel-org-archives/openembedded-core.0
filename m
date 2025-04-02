Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76395C36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 01:45:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.3745.1743558338560824869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 18:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Y6CwehGf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5320tbuh014402
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 01:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LwquOxCHaI+r+ze8Kw1WLjtvVpBe2JaqpVt1ESdAnzQ=; b=Y6CwehGfVAFB1JC6
	ZBR8mEhTP3s1Hvxt1VKj3tUr2SX+Iyg9zXzCkVH3ZdU+lqDh6o5nSZQ0NxSWTK2b
	1iq46O/jy89svfJjDfMZukyX7skvHhlPzVwxg/lA3IPZc49LOD5K8s9T+QpKmuh/
	WCwofh+M1JwvXCYeHo8tVJdw+WFTcgwujNqlXgdA73GUK57jFoqmifrIr3JmZN8q
	C5uALZ6R0SMp/4x99VbWYul/hMoD6dM+YTQQbX1YkxDyvC8nKYmsonyGn4ShQMzk
	fVPNbxpYZx3+n2pqB5tTlDcR7XlKJznO8dbHZhr7vCp7NAqHJ4mE+71rY6LnBR4z
	tPqboQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvhscg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 01:45:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5b9333642so709122085a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 18:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743558333; x=1744163133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LwquOxCHaI+r+ze8Kw1WLjtvVpBe2JaqpVt1ESdAnzQ=;
        b=fuAwl7yLTnLA++Vbof12JQcHyrXNdAiqzoafvPIuiTwFfb3eRCzf5eZwESXI4htbMh
         1DSvGzNIBXUW8+ccQ5eDFKqe+fbQ5qjWaNfM8/+Nrg9CiceDTfYq6pvrDd2OAFxv5qCS
         5ceNYqNtLS+ti7ESV2BuYKfj7gakwXgw6HnJD3DOAMk812GZAf6DSiN/EP2IFBwL7VQI
         tRKEKwiF64WSZHPb9q9DEpZcIDI72Ki6BCW+BlNaNlrT8XtXVase1ffiT1ZHU656aidR
         sP50RfeeeJ24cAYZh7hFFQtwsOrUg/dR8VX+6rfqKNjNjPKc0LGh0KsGa1riLaSM3k9o
         Er4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7xCp3Ddj0YQMoTmbNqfqqC0rfDS7pbDXfGhM4ht0qP1rLwlFOU29562BBDX9AfB4U4vtSfuYPuySU4EXmtVbwHg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZz4CVOoTK+4T6Wewf4CE/EXIJKv7vLcYm3CiAmqhwyuplT2cB
	xiPoP0TZ+HtCtEKXzFbP/WV9Gbbyh63/7VY58RNSf3J6RhVT+W3IISoiugj0AnzkRGJWN8H9n8a
	Z9dHx7fTn9DfO0dyIFreElMAWSvb1WBHgbjAtor4Q/kb7R9va4rfnsqmd3PY8n700mbygVkoT/n
	+OUZc=
X-Gm-Gg: ASbGncuwRerKOqktfp8LG/2oNS71tuHxvWKF9mgjt8Osw2NCdKlPhvp2kllHNn7R/hK
	6VMGEthkk4098B1AGTxBisvEe8klcv/lcpCtXPT6ijedGoQYXekuulEQUTLJCNiX89PvXHkWuQ+
	lz8poZOfbFJp7QR6rB3SrBdGiRqTQSjLWmorGUU3eJqkMemDmnKhJm0RUgNZvcRg0hPgw93aVO4
	ETUFyXi02Pe01vdcmhjSUQ+JFm30wu3A5RAHGYQPKpgwyQFKZiHQtWCXWulm6xxvhWpZKxCzOdZ
	NdAxAg237n8DSXwdu/KpPjA9fhXyfN+dLcDbxefOvAV9azQvCJDfZbv7pFangNP9s5xwjmGXqJb
	UKzdXzW6LlzCccN5OgoIunD9Sw6+O1rOouz/v5+gJ61DyT2SFp0IuMX+vWIh6N2DFAwzjzlt2
X-Received: by 2002:a05:620a:4096:b0:7c5:642f:b22f with SMTP id af79cd13be357-7c68f406bd1mr1959038785a.18.1743558333427;
        Tue, 01 Apr 2025 18:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUxhy2oKHQ2MUx/I28x6S1Pic4UwG5jB/pPKdvMKfpH2L/0T/fMxMmBDdvI0ZdEvZbN/RWiA==
X-Received: by 2002:a05:620a:4096:b0:7c5:642f:b22f with SMTP id af79cd13be357-7c68f406bd1mr1959035685a.18.1743558333029;
        Tue, 01 Apr 2025 18:45:33 -0700 (PDT)
Received: from ?IPV6:2001:14bb:673:ef86:c470:fec3:f470:6643? (2001-14bb-673-ef86-c470-fec3-f470-6643.rev.dnainternet.fi. [2001:14bb:673:ef86:c470:fec3:f470:6643])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095801cfsm1504114e87.143.2025.04.01.18.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 18:45:30 -0700 (PDT)
Message-ID: <0926082a-b09e-4d8d-8199-671823db87bd@oss.qualcomm.com>
Date: Wed, 2 Apr 2025 04:45:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 0/9] mesa: upgrade to 25.0.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>,
        =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
 <D8V4RQR2X3EF.46ET3A2PKUAL@bootlin.com>
 <8d4b0884-985f-4e81-a3d3-03a1abb91e73@oss.qualcomm.com>
 <CANNYZj_aEritSc0Te9hWR+OZVQ1DDFY0b4A0Q0H148L5YjEKcw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CANNYZj_aEritSc0Te9hWR+OZVQ1DDFY0b4A0Q0H148L5YjEKcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67ec96c1 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=xL-Uw_gs7RH4_02fTGwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: JJQl0kc0Nv907h2sgbtyX2kstsO_YKYl
X-Proofpoint-GUID: JJQl0kc0Nv907h2sgbtyX2kstsO_YKYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_01,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 01:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214164

T24gMDEvMDQvMjAyNSAxOToyOCwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+IE9uIFR1
ZSwgMSBBcHIgMjAyNSBhdCAxODoxOSwgRG1pdHJ5IEJhcnlzaGtvdiB2aWENCj4gbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA8ZG1pdHJ5LmJhcnlzaGtvdj1vc3MucXVhbGNvbW0uY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4+IEVSUk9SOiBtZXNhLW5hdGl2
ZS0yXzI1LjAuMi1yMCBkb19jb21waWxlOiBFeGVjdXRpb24gb2YgJy9zcnYvcG9reWJ1aWxk
L3lvY3RvLXdvcmtlci9vZS1zZWxmdGVzdC1kZWJpYW4vYnVpbGQvYnVpbGQtc3QtNTM4NDIv
dG1wL3dvcmsveDg2XzY0LWxpbnV4L21lc2EtbmF0aXZlLzI1LjAuMi90ZW1wL3J1bi5kb19j
b21waWxlLjUwNjQ3NycgZmFpbGVkIHdpdGggZXhpdCBjb2RlIDENCj4+PiAuLi4NCj4+PiB8
IEZBSUxFRDogc3JjL2ludGVsL3NoYWRlcnMvaW50ZWxfZ2Z4ODBfc2hhZGVycy5zcHYNCj4+
PiB8IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9vZS1zZWxmdGVzdC1kZWJpYW4vYnVp
bGQvYnVpbGQtc3QtNTM4NDIvdG1wL3dvcmsveDg2XzY0LWxpbnV4L21lc2EtbmF0aXZlLzI1
LjAuMi9idWlsZC9zcmMvY29tcGlsZXIvY2xjL21lc2FfY2xjIC4uL21lc2EtMjUuMC4yL3Ny
Yy9pbnRlbC9zaGFkZXJzL2xpYmludGVsX3NoYWRlcnMuaCAuLi9tZXNhLTI1LjAuMi9zcmMv
aW50ZWwvc2hhZGVycy9nZW5lcmF0ZS5jbCAuLi9tZXNhLTI1LjAuMi9zcmMvaW50ZWwvc2hh
ZGVycy9nZW5lcmF0ZV9kcmF3cy5jbCAuLi9tZXNhLTI1LjAuMi9zcmMvaW50ZWwvc2hhZGVy
cy9nZW5lcmF0ZV9kcmF3c19pcmlzLmNsIC4uL21lc2EtMjUuMC4yL3NyYy9pbnRlbC9zaGFk
ZXJzL3F1ZXJ5X2NvcHkuY2wgLi4vbWVzYS0yNS4wLjIvc3JjL2ludGVsL3NoYWRlcnMvdXRp
bC5jbCAtbyBzcmMvaW50ZWwvc2hhZGVycy9pbnRlbF9nZng4MF9zaGFkZXJzLnNwdiAtLSAt
RE5ERUJVRz0xIC1ER0ZYX1ZFUngxMD04MCAtSS9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtl
ci9vZS1zZWxmdGVzdC1kZWJpYW4vYnVpbGQvYnVpbGQtc3QtNTM4NDIvdG1wL3dvcmsveDg2
XzY0LWxpbnV4L21lc2EtbmF0aXZlLzI1LjAuMi9tZXNhLTI1LjAuMi9zcmMvaW50ZWwvc2hh
ZGVycy8uIC1JL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL29lLXNlbGZ0ZXN0LWRlYmlh
bi9idWlsZC9idWlsZC1zdC01Mzg0Mi90bXAvd29yay94ODZfNjQtbGludXgvbWVzYS1uYXRp
dmUvMjUuMC4yL21lc2EtMjUuMC4yL3NyYy9jb21waWxlci9saWJjbCAtSS9zcnYvcG9reWJ1
aWxkL3lvY3RvLXdvcmtlci9vZS1zZWxmdGVzdC1kZWJpYW4vYnVpbGQvYnVpbGQtc3QtNTM4
NDIvdG1wL3dvcmsveDg2XzY0LWxpbnV4L21lc2EtbmF0aXZlLzI1LjAuMi9tZXNhLTI1LjAu
Mi9zcmMgLUkvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvb2Utc2VsZnRlc3QtZGViaWFu
L2J1aWxkL2J1aWxkLXN0LTUzODQyL3RtcC93b3JrL3g4Nl82NC1saW51eC9tZXNhLW5hdGl2
ZS8yNS4wLjIvbWVzYS0yNS4wLjIvc3JjL2ludGVsIC1JL3Nydi9wb2t5YnVpbGQveW9jdG8t
d29ya2VyL29lLXNlbGZ0ZXN0LWRlYmlhbi9idWlsZC9idWlsZC1zdC01Mzg0Mi90bXAvd29y
ay94ODZfNjQtbGludXgvbWVzYS1uYXRpdmUvMjUuMC4yL2J1aWxkL3NyYy9pbnRlbCAtSS9z
cnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9vZS1zZWxmdGVzdC1kZWJpYW4vYnVpbGQvYnVp
bGQtc3QtNTM4NDIvdG1wL3dvcmsveDg2XzY0LWxpbnV4L21lc2EtbmF0aXZlLzI1LjAuMi9t
ZXNhLTI1LjAuMi9zcmMvaW50ZWwvZ2VueG1sDQo+Pj4gfCAvYmluL3NoOiAxOiAvc3J2L3Bv
a3lidWlsZC95b2N0by13b3JrZXIvb2Utc2VsZnRlc3QtZGViaWFuL2J1aWxkL2J1aWxkLXN0
LTUzODQyL3RtcC93b3JrL3g4Nl82NC1saW51eC9tZXNhLW5hdGl2ZS8yNS4wLjIvYnVpbGQv
c3JjL2NvbXBpbGVyL2NsYy9tZXNhX2NsYzogbm90IGZvdW5kDQo+Pg0KPj4NCj4+IEkndmUg
Zml4ZWQgYWxsIG90aGVyIGlzc3VlcywgZXhjZXB0IHRoZSB4MzIgKHdvcmtpbmcgb24gcmVw
cm9kdWNpbmcgaXQNCj4+IG5vdykgYW5kIHRoaXMgb25lLiBXb3VsZCB5b3UgaGF2ZSBhIHBv
aW50ZXIgdG8gdGhlIGJ1aWxkIGpvYj8NCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9j
dG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzM1L2J1aWxkcy8xMjY0L3N0ZXBz
LzE0L2xvZ3Mvc3RkaW8NCj4gDQo+IFRoaXMgaXMgaW4gY29udGV4dCBvZiBvZS1zZWxmdGVz
dCwgYnV0IGl0IGlzIHNpbXBseSBidWlsZGluZw0KPiBxZW11LXN5c3RlbS1uYXRpdmUgb24g
ZGViaWFuIDEyIC0gSSBzdXNwZWN0IHRoZSBtZXNhLW5hdGl2ZSBmYWlsIGlzDQo+IHNwZWNp
ZmljIHRvIHRoYXQgaG9zdCBkaXN0cm8uIEkgY2FuIHRyeSB0byByZXByb2R1Y2UgaWYgeW91
IG5lZWQgaGVscA0KPiB3aXRoIGl0Lg0KDQpJdCdzIHJlYWxseSBzdHJhbmdlIGFzIG15IGJ1
aWxkIGhvc3QgaXMgRGViaWFuIDEyLiBBbmQgaXQncyBldmVuIG1vcmUgDQpzdHJhbmdlIGFz
IG1lc2EtY2xjIHdhcyBidWlsdCBmZXcgbGluZXMgYWJvdmUgKDE2NDA2KS4NCg0KLS0gDQpX
aXRoIGJlc3Qgd2lzaGVzDQpEbWl0cnkNCg==

