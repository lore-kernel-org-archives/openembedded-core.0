Return-Path: <robert_henz@jabil.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456F5C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 17:55:46 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.94])
 by mx.groups.io with SMTP id smtpd.web11.267.1663696544967738709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 10:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jabil.com header.s=selector1 header.b=MtVGrlQz;
 spf=pass (domain: jabil.com, ip: 40.107.92.94,
 mailfrom: robert_henz@jabil.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agRKDZQnZCaTxrPgRrgjq9DffiqkJGVrvAVrFftt++p/qIbzR2uhB6gak5dr2z7KavGenGXgY2BwbnoOMbMguxLxntpULGlHC/O/Q248ZVhaBv97yB99hl1h6oRnNyQsEVhGWTyMeLDIpktG4Xw5L634nIgLfjcZwuSmXkSPBjEe/vkI6OYe1pOxjo5+3VkQgx8pz4ccU53nuPaleszFnjJXazZ4bODxwoAskOsZ42KUl8+2WiK7Ur6utuy16nGAB5r6R4GZ6wJHrv3u31GrCgmMtsbL2HFTKxaGW3ec8FJPd2Mxt0hl9N4vsYkZSK3j1ydVN1FIR669z7rECsCF9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHNXNvL91qQVG/SgEr3qHw009nxoUkuql3UV/Y4tgXo=;
 b=ioSnsLZ8QUgOJksVZIJi6VEEmB/xF8Bebd5xZGNhjL5nHlLJZcB59u8dnUGYHpwl39RFc8IHlW7hbMbW/UwoCN3BmPx9z0Bt78Fkjsk7qM1ZZOw68lgfTLR3AjS9v2A+2PZcpfGbOHnifm7dII69ToHFV/OKG+N9c5sFtf8EiBNf1OLJo+rUyWQBhdnM0z5+julOeqpPvZbwLn/jXBMI+zDrXUqNoENUXte0MRsVSqxqgk9zzjN1YUhjCNxazh1uJ9gtBMpGXEt1gEXfpvssbm8pN+BcPwqN5vtzk4NCBzyU9kRTGAlgcOLqxtR+wcemILumtJobJavG1ufPgPTw0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jabil.com; dmarc=pass action=none header.from=jabil.com;
 dkim=pass header.d=jabil.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHNXNvL91qQVG/SgEr3qHw009nxoUkuql3UV/Y4tgXo=;
 b=MtVGrlQztBY/4hJFwErTj0hx7l/EaSNvm6ljBDvmwwwcufTu0GPsV+L+gqw8idk4JNBUBpitLbnOKgkpyXw3Bs3LNalHHyF4vCNEtpwUcUxabArCdeRR5Py/zrM+CdwVw74CcDWkdBrop2aHS+RKJL3KH2EBph9JHheBCpgskPAMxWkw85y2I3rMuhrzEYbb4UcbPFWsv3ewjvrJkIX7gjlQC08iDFUYhmHdLcLEhb7YtW7y0nEnqUkfDtIaSqY0MxrfQpINjRd0Wkj11a9Y0TKxfB+aLqzWq0NTjez4+uswuvgX2x7EvXlTwsby2OyzJOOPu0domeRSLma8Vu0LbA==
Received: from DM5PR02MB2218.namprd02.prod.outlook.com (2603:10b6:3:55::10) by
 PH0PR02MB8679.namprd02.prod.outlook.com (2603:10b6:510:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 17:55:42 +0000
Received: from DM5PR02MB2218.namprd02.prod.outlook.com
 ([fe80::fc3a:c696:b416:aee9]) by DM5PR02MB2218.namprd02.prod.outlook.com
 ([fe80::fc3a:c696:b416:aee9%12]) with mapi id 15.20.5632.021; Tue, 20 Sep
 2022 17:55:42 +0000
From: Robert Henz <Robert_Henz@Jabil.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: PR to fix WantedBy parsing of systemctl
Thread-Topic: PR to fix WantedBy parsing of systemctl
Thread-Index: AQHYzQWznyTD58gH9ESfGzUBG724QA==
Date: Tue, 20 Sep 2022 17:55:42 +0000
Message-ID: 
 <b5c12365825c4ccf862a0d58029b0939DM5PR02MB221823F6928D9018544ECA3B834C9@DM5PR02MB2218.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Jabil.com;
x-ms-traffictypediagnostic: DM5PR02MB2218:EE_|PH0PR02MB8679:EE_
x-ms-office365-filtering-correlation-id: e96572e5-9f4c-4812-4c40-08da9b3155c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rr0ttusM/Tof1C7jN6wThMDtABz0FXbUkv/+aaSLeKCOmpkvx+Wpn1RldN4a/3v5i/QTcokzyqpkeKgMN7LR4IcuyTYyskUm/Ga2nc+1FludN8ncr5RtP6NPoVGjV0OPiKWtpnEeSl5T6csgVh4w77XKKESG9t4E6fOk6E1VZwuT1jGS/Iwquo5BTsoQ4iLRSF2c+1cwCB94ZEMTEAbboI4ICs++6QARvl4GvC6hSN1d9oJF9Ad9TokscFFaSWCjAo9tk4KJVhwZ6mFzf+akfJFbvQXtEAiXaGC42RlN9hhm7/kT8rGefIKjRMtMjqvhNh8L35zcO8krYGjQqsYOJBnKW50hqcEA9CTM+3XCcAziJNdUHCwki2tWMxyZ4Sf1eBSO518o+AdRoZ4soQUCy5HgmXLRGRRWavYmZANN/zfwtK3GV28YzEyhXi/mF/cHReSa1qW3YTZz9GHPxU4SWbNoBPj22x+jbfLL42wu5sw6xcGd3SUxtR5Ye4QcV/M/TATHKsLddZmwZ523LDTYfaJX0zQbSkNwr5Gl8Kk7Cr34qZwwOK+13EVyvZexpYD7RQBoJ+JdKl+TTAFeLc7TQTy/A1V0h0Z72Vk4MlRIQAFlJPtc3raCOkmLjnrtgtpAqyHrq+f7nf0mzWT08xGWkdPvMv2STOXVmnh2Jc5fyFW/gvQZSJ90OHNTiMygkWiT16JO1z18VvdbLMmNVXrqkc/9wLGU7b+ChMaOkr+vsPJgOQUGocusBqSJ7TI3C4E3CqqAgdFSDRG7LjWeRR24aH+jgK/FGUZdVsL2Z5qyluE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR02MB2218.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199015)(4744005)(19627405001)(99936003)(5660300002)(2906002)(6506007)(186003)(7696005)(8936002)(71200400001)(82960400001)(41300700001)(26005)(9686003)(91956017)(38100700002)(478600001)(166002)(38070700005)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(122000001)(8676002)(55016003)(316002)(966005)(6916009)(86362001)(19627235002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?v3Qn5ycM14X5tZA6eIUDkngT1WI1GBfBW/tiEgWkKHs/qaWHch0lo8hgnT?=
 =?iso-8859-1?Q?nPU2vCVTotISxbBC3cmR9WTpMMZ4OmbVaHFttCqDKscEl272fF9kptaTqL?=
 =?iso-8859-1?Q?TkD7B7IzyYeji9nJBfrGnBAsdIctv2fi0rfMji3r8/9MhJbRAiCczPot8I?=
 =?iso-8859-1?Q?/fy76K3zdLCn8TjDscI6GXSJBxpGRAAAxIHJtab47K3Tkth1U/JgmZ25Kv?=
 =?iso-8859-1?Q?iOL+mtbAcI49l1PBBvMmeWa7MOiWpPY/H3zdxbR4fo6rkJaQ7TtMLQNYy/?=
 =?iso-8859-1?Q?j9B5aJ6Us21uswdq6+EjL0hrAy4qlbqLJ6UJ473oaHDfgIuXgcDGS6rinb?=
 =?iso-8859-1?Q?E7wFJTyzOIAlYlXtmg7A5JYs0lYlHQkcrYs8/4YwqPA/udW/kViFEoqEdd?=
 =?iso-8859-1?Q?ZyyxkwVDlBjaiCD91aZAZTAdokqR0m3RbL1AqujD1hYQNdBvrb0elI7i7J?=
 =?iso-8859-1?Q?59z3O1FNfhTFUZ9BctEdRrIWl86qj7opkaW2ABSv8Z/ZdFSM2aq23OpVj1?=
 =?iso-8859-1?Q?wNmqo0ho/ya9HezT/A56OtqAwCXo/XnSUaVRncrCxtUl8xW11wWsTsg3w3?=
 =?iso-8859-1?Q?OxzuNV3xDPUiZ0i9vyZJZoI17Ek575hxSmtP15AbjcMZXKVP+dtH/VtrJW?=
 =?iso-8859-1?Q?g+Y+4j6vGA8T60qCcb+hNZTXizZkyrkh4N5y6gxKMJfrtXRouSI43uF+wo?=
 =?iso-8859-1?Q?gLnWxnjMRzxhdpkEUfeiqZGlXJ3xgoLCtkV9pPfr4vTtIfm6si8xphCzUu?=
 =?iso-8859-1?Q?y4MD7EbSDj8IXxmqQnT/FMJTzKJSW5R7rP9W8PX8poJTLSu0lDLArJJ0m9?=
 =?iso-8859-1?Q?9vWIJEtqa9RA3RAj9jDEXcho9l+E5GwtemuaIq0vRNM8GXhIJK6ED1xje6?=
 =?iso-8859-1?Q?98esh87m4tj434uLWgKcFsvd/a7MyGMdonI5ulNkJ0v2AmsQuAG4iDYUWC?=
 =?iso-8859-1?Q?8GYB4xq8qIdh/HIdWFK1p4zmMIM32ImNQWKSXn8S7t2JjBZXg+tfl2WRU9?=
 =?iso-8859-1?Q?BPSEKXX477v/BTKea4z8f72oD4Yla4nDsvWbj+JMdaaUzGdFXuAiErui+F?=
 =?iso-8859-1?Q?cOB201Rffq9XEcnMZqLEO5BP493GKvkEYJ5NqYDPcrEW+ilFy7IC1wIsZc?=
 =?iso-8859-1?Q?qU9oQw1UUBxZuwAE2ERNr91D9HcEw6TGYqM4L0UglAg8mIkcB0NnQl4+/f?=
 =?iso-8859-1?Q?CaCjOnDrKOGTCiseHopY7V3s6mKsS1oTQcohCe15gFOy1Aw0Okka7WcliZ?=
 =?iso-8859-1?Q?KpEoUbwFTxThucq0ikqcrbhgk5pQOQkXK2406GA9e3/zxQyvXHmUPzUeGf?=
 =?iso-8859-1?Q?IEyod8t7rsPDDaJogA4Crvc4wFvzTKsh5uzVaTxY7FXwvipuA6CAnzmOKL?=
 =?iso-8859-1?Q?SAdu3hCcJ92/zv25aTe7m/badsibpK6ILbokoCC33Dr7zVowmIdB1pRKdo?=
 =?iso-8859-1?Q?Ih0c4ANVXsG24z3RifdsaqyGx1jyFtR9rxOh+3LmP7YGZ6+vL4uBoNNiXh?=
 =?iso-8859-1?Q?u46nL6TDKBFkvlYvp54ryuk8UmmcRQ69Pt7gkBpne2myq5x92cS/KVNG2z?=
 =?iso-8859-1?Q?fd9jDk1/JD794I3xj2QxcS9n3HOwmkDpL8xO5YFoeC9XgvH1SNpNv9xIdF?=
 =?iso-8859-1?Q?SW6BekK7bsO7MOTFW4VXpEx8tjUlLauPB1?=
Content-Type: multipart/mixed;
	boundary="_004_b5c12365825c4ccf862a0d58029b0939DM5PR02MB221823F6928D90_"
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB2218.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e96572e5-9f4c-4812-4c40-08da9b3155c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 17:55:42.0508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 YgwHniNw0bFb8wnyHlnts/FR/ZqmClZjS3lctyxXkQwtA4cdAjCFWp/fykFnDrOx6DMnXEWTU8+I1o/tuALJtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8679
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 17:55:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170905

--_004_b5c12365825c4ccf862a0d58029b0939DM5PR02MB221823F6928D90_
Content-Type: multipart/alternative;
	boundary="_000_b5c12365825c4ccf862a0d58029b0939DM5PR02MB221823F6928D90_"

--_000_b5c12365825c4ccf862a0d58029b0939DM5PR02MB221823F6928D90_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I have a PR to fix the WantedBy parsing of the systemctl script. I tried to=
 follow the process described in your wiki (https://www.openembedded.org/wi=
ki/How_to_submit_a_patch_to_OpenEmbedded), but ran into some problems I was=
n't able to figure out. I will attach the patch file for my suggested chang=
e to this email but I also went ahead and created a fork and generated a Gi=
tHub PR in case that is ok/easier?

https://github.com/openembedded/openembedded-core/pull/78

Again, I apologize for not being able to follow your defined procedure, ple=
ase let me know if there is additional information you need from me.

Thanks,
Bob

--_000_b5c12365825c4ccf862a0d58029b0939DM5PR02MB221823F6928D90_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: <F98C69DC8ADB0E44957FF3D9089EDF1D@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
Hi everyone,</div>
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
I have a PR to fix the WantedBy parsing of the systemctl script. I tried to=
 follow the process described in your wiki (<a href=3D"https://www.openembe=
dded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded" data-auth=3D"NotApplic=
able" id=3D"LPNoLPOWALinkPreview_1">https://www.openembedded.org/wiki/How_t=
o_submit_a_patch_to_OpenEmbedded</a>),
 but ran into some problems I wasn't able to figure out. I will attach the =
patch file for my suggested change to this email but I also went ahead and =
created a fork and generated a GitHub PR in case that is ok/easier?<br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_1 _EReadonl=
y_1"></div>
<br>
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
<a href=3D"https://github.com/openembedded/openembedded-core/pull/78" data-=
auth=3D"NotApplicable" id=3D"LPNoLPOWALinkPreview">https://github.com/opene=
mbedded/openembedded-core/pull/78</a><br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
Again, I apologize for not being able to follow your defined procedure, ple=
ase let me know if there is additional information you need from me.</div>
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family:Calibri,Arial,Helvetica,=
sans-serif; font-size:12pt; color:rgb(0,0,0)">
Bob<br>
</div>
</body>
</html>

--_000_b5c12365825c4ccf862a0d58029b0939DM5PR02MB221823F6928D90_--

--_004_b5c12365825c4ccf862a0d58029b0939DM5PR02MB221823F6928D90_
Content-Type: text/x-patch; name="0001-Fix-WantedBy-processing.patch"
Content-Description: 0001-Fix-WantedBy-processing.patch
Content-Disposition: attachment;
	filename="0001-Fix-WantedBy-processing.patch"; size=1608;
	creation-date="Tue, 20 Sep 2022 17:48:17 GMT";
	modification-date="Tue, 20 Sep 2022 17:55:41 GMT"
Content-ID: <6B9027ECE38AA140A16982594635C43C@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSA2Y2RiMjA3ZWQ5OWJjODIzMjRmYjdiODUxMjY0MjVhYzhkNDM5MDcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCb2IgSGVueiA8cm9iZXJ0X2hlbnpAamFiaWwuY29tPgpEYXRl
OiBNb24sIDE5IFNlcCAyMDIyIDIyOjAyOjU4IC0wNDAwClN1YmplY3Q6IFtQQVRDSF0gRml4IFdh
bnRlZEJ5IHByb2Nlc3NpbmcKCkFuIGVtcHR5IHN0cmluZyBhc3NpZ25tZW50IHRvIFdhbnRlZEJ5
IHNob3VsZCBjbGVhciBhbGwgcHJpb3IgV2FudGVkQnkKc2V0dGluZ3MuIFRoaXMgbWF0Y2hlcyBi
ZWhhdmlvciBvZiB0aGUgY3VycmVudCBzeXN0ZW1kIGltcGxlbWVudGF0aW9uLgotLS0KIG1ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1zeXN0ZW1jdGwvc3lzdGVtY3RsIHwgMTEgKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLXN5c3RlbWN0bC9zeXN0ZW1jdGwgYi9t
ZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtc3lzdGVtY3RsL3N5c3RlbWN0bAppbmRl
eCA2ZDE5NjY2ZDgyLi5jZGRhZTc1YTA2IDEwMDc1NQotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWQtc3lzdGVtY3RsL3N5c3RlbWN0bAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQtc3lzdGVtY3RsL3N5c3RlbWN0bApAQCAtMjYsNiArMjYsOSBAQCBs
b2NhdGlvbnMgPSBsaXN0KCkKIAogY2xhc3MgU3lzdGVtZEZpbGUoKToKICAgICAiIiJDbGFzcyBy
ZXByZXNlbnRpbmcgYSBzaW5nbGUgc3lzdGVtZCBjb25maWd1cmF0aW9uIGZpbGUiIiIKKworICAg
IF9jbGVhcmFibGVfa2V5cyA9IFsnV2FudGVkQnknXQorCiAgICAgZGVmIF9faW5pdF9fKHNlbGYs
IHJvb3QsIHBhdGgsIGluc3RhbmNlX3VuaXRfbmFtZSk6CiAgICAgICAgIHNlbGYuc2VjdGlvbnMg
PSBkaWN0KCkKICAgICAgICAgc2VsZi5fcGFyc2Uocm9vdCwgcGF0aCkKQEAgLTgwLDYgKzgzLDE0
IEBAIGNsYXNzIFN5c3RlbWRGaWxlKCk6CiAgICAgICAgICAgICAgICAgdiA9IG0uZ3JvdXAoJ3Zh
bHVlJykKICAgICAgICAgICAgICAgICBpZiBrIG5vdCBpbiBzZWN0aW9uOgogICAgICAgICAgICAg
ICAgICAgICBzZWN0aW9uW2tdID0gbGlzdCgpCisKKyAgICAgICAgICAgICAgICAjIElmIHdlIGNv
bWUgYWNyb3NzIGEgImtleT0iIGxpbmUgZm9yIGEgImNsZWFyYWJsZSBrZXkiLCB0aGVuCisgICAg
ICAgICAgICAgICAgIyBmb3JnZXQgYWxsIHByZWNlZGluZyBhc3NpZ25tZW50cy4gVGhpcyB3b3Jr
cyBiZWNhdXNlIHdlIGFyZQorICAgICAgICAgICAgICAgICMgcHJvY2Vzc2luZyBmaWxlcyBpbiBj
b3JyZWN0IHBhcnNlIG9yZGVyLgorICAgICAgICAgICAgICAgIGlmIGsgaW4gc2VsZi5fY2xlYXJh
YmxlX2tleXMgYW5kIG5vdCB2OgorICAgICAgICAgICAgICAgICAgICBkZWwgc2VjdGlvbltrXQor
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZQorCiAgICAgICAgICAgICAgICAgc2VjdGlvbltr
XS5leHRlbmQodi5zcGxpdCgpKQogCiAgICAgZGVmIGdldChzZWxmLCBzZWN0aW9uLCBwcm9wKToK
LS0gCjIuMzQuMQoK

--_004_b5c12365825c4ccf862a0d58029b0939DM5PR02MB221823F6928D90_--

