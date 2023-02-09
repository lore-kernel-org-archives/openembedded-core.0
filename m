Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28B3C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 06:38:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8265.1675924730265584395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 22:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oQIj8tg2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14046bdfb7=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3196TxsG019406
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Feb 2023 22:38:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=Ca1byzB/l00E2YyGTRi+w4YEMpD1p/s/mtBI/Pr8lIQ=;
 b=oQIj8tg24pLSHbmWlCdNokThXcFGKnj9GqgiktsBX3kaURusVhSlcTs/aGpX3B0O1v6U
 mxjc7uloo59/8Zefd8B2i3plTAQO+2zS7ac1LBH3nyu/RNhXX43UjjjeKDMMfh6th/yE
 Ay1tJY/8pusfc8FGx+tMAczYzTTPMT3fDt5HDeuPS/VB9xFiFo0Tm6/wftgOOcPfwRXf
 KNRISmTNM1Xaxjr/iZJ88vxB9i7cce+D9GdhRVHSE+E5zRdT746g6IVEXQj9cRfZxZlg
 0GY1nDdG13C7SAd6I7Avx9m1EajsBzRJ6odDS6XbqY7yOZeH4Xw/eEPkY+fN7X9OCpk/ bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhkh9cv86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 22:38:49 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3196cmj5004593
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Feb 2023 22:38:48 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhkh9cv84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 22:38:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmjzyBNIRtiKjPlD79lQbExPmUlVmQ+uV12SfNpKj+Dv0vb/9ke7QyIHaEWtz464bHmQBhEJE+xcKCpEtHW7LnoBHJJQn4HS6lYJ+JM0dc/6MPMeTB2V2J83gvdlBUoeM27mvbMK4Y1K8luvrn9mHHG7mLZTNp+GQclSxrHft/IHvQ4vzx1KOGflXBTxFZ4yGB+4dmy+7wLLreUNMcfaM86vFnTb+o4lm1hclDhzbNMylD/MvTC4jdtw+cTG6dRstP7PvZZh557F6PM6PK0VWkvtdbWOwh8VJ0V6CVwe+ft/1ATzUAay1wnPJ/X9iw0ck2EinrXSDTQqikcb4Qop2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ca1byzB/l00E2YyGTRi+w4YEMpD1p/s/mtBI/Pr8lIQ=;
 b=Kzajm2shHbjHFUd/6N7dSYFJ8kwQMrsLi2arm9Cw9UBASDjzEZwthq6FYJzouBuwLsryArN80TfazDGKAZQ2ZpWTQ7rHNREQeiUE3rF1Y4TLCXyy7la9rKNzFXWKdcAg0Pm1S3Tz8Eym09BBVJrt7VK9NJCFOkIkKu21AxyqQLlPRL9Cha4iJUqhZvShT3554pXY6LNW5/kjUKeV58lALCZM3ZOSanULgqd2cMTjheYX/BpJs4wm6hsijqTJ33NNX/OXkZC8JP7xQWWFEoNVZlVuEvoLkPpPydC/RqDL9GXhJ0MK85zTIRY6QC1mgQqYuVrVVUTsPbk2m7LEq5oaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB6356.namprd11.prod.outlook.com (2603:10b6:510:1fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 06:38:38 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::53d6:17ce:f612:ba23]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::53d6:17ce:f612:ba23%5]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 06:38:37 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Gowda, Naveen"
	<Naveen.Gowda@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>
Subject: Qemu doesn't respond while logging in for the Rust Oe-Selftest
 implementation.
Thread-Topic: Qemu doesn't respond while logging in for the Rust Oe-Selftest
 implementation.
Thread-Index: AQHZPEJcbh+5LfPfTkKDYg9cEGQqgA==
Date: Thu, 9 Feb 2023 06:38:36 +0000
Message-ID: 
 <SJ1PR11MB6129BF5151577F93D523A6F4EBD99@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB6356:EE_
x-ms-office365-filtering-correlation-id: 0611f769-5e4a-4cb8-790c-08db0a6845f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qInhrktwpfoyHwHIWccU3WkkZ7beIkxrd+vTghnpB4CnnEuxFCrH3ET41NqxTo2PfHDap0+yU3cn5zIt8zGuJv/w2bEAqeY6gte3Et/UMozO38AQwepRUAnhDO8hEDzdyHfedZnf/7NkiYmNvePj/k10K2NqKRYFKfZEyM2JjvZ2zQjEUBagWLjVx9hZIaE9bYwjg4XjUZ2sVrQ3MThKDoZEpaggP/ZFDcUdV4Qoz+g6MsUmFkm4jw8dzfVdonutqogzlUSFKvTTcBvxJcZOVGjgUFVHdw+/4FdRsSe854g4Yj05KfFb5ODQpHpLUqGNi7I4CyqUt3R2JLphVXLO3++NtiJdE9/bs/7PjWoVOgblfxD4qn4Xa6GleMGFAVv/euMqrrcAbAdO0uMRUVAfROnDD69KXLhJSea+KmXZICdP3dWMKKyCLBVWB2MKSCoXRRxnAD/lKNrRgQUB9S5vZSnMbir62IkCFfRM+GCpiowVUMeZUffQZfivGrysaas/9wvFMOzAsP/l+I+afFNll/oX/rYErM+fwprrPIZ9N56gOc8tu5i+q0DNpmgILw8dGlgN6ENiM/UIXqOynIzQ5CE8E/dppUR6x6miTnjQ8tvssJvy63GQWg4ijwPnwNhM18Md2sk7kvP4914GjCaeAVwq0oDxCRgs1vXCOqeovE02TMx9ZN4MNNN+np5M+h+/nEulHqL37IRsH65D2T/ZTmtNoLves0w2od03reynH3wmsCP3LhRRREQvjs3EKSj0cEtTbbJCsYNUqFWIYNL2yKm/+YKk/jept94jrwi/8Xo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(451199018)(110136005)(316002)(54906003)(122000001)(99936003)(38100700002)(2906002)(38070700005)(86362001)(166002)(66476007)(66556008)(4326008)(33656002)(64756008)(8676002)(66446008)(83380400001)(76116006)(66946007)(8936002)(52536014)(55016003)(5660300002)(9686003)(478600001)(186003)(107886003)(7696005)(71200400001)(966005)(26005)(6506007)(41300700001)(47845001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?d0+RMWI1sSgMIipSWu8g5gnAcwVwXc2yu2b68HOyVQJaWFlIXX3WYCSieSIr?=
 =?us-ascii?Q?RjOfaavKjeeyesS3VOM7jvMBWyP9fsi2jvrItVFwGzZ3jSKRiVm6tAkmBgeZ?=
 =?us-ascii?Q?T6WlH2KKit46En0k0XPO5+Zh7CHuLvxlt2NUXsBQmyK/xllhCwtU1veufwqS?=
 =?us-ascii?Q?gvitYfAGgGrKhMaQZ2nfI/QGzEleXBWBa471ccBhXzDoJAVs6ePlmKTbOwaK?=
 =?us-ascii?Q?p9Ntq+inhxEgs/9+4mPhqgEIONOHa8YocoVEZ3tMjcKr7EP2pKE1lXe4i80q?=
 =?us-ascii?Q?Hq0SZghEw7T8v7lIctGTtRSyGYor28IZ+U6P6/GO5f6KLMcTorZz1ugpoFM0?=
 =?us-ascii?Q?KGWT23h2nafR1mIVk5tAJJEXax+P34XJxuqUfrqZt9wuOzuvE+s8DOt5Zm7L?=
 =?us-ascii?Q?FResVLbdSoVvsSlUaflot/WiZ1PyN4C6FOqPcHkpFpoK3zFghwVCDgQpEHU2?=
 =?us-ascii?Q?0WJibMx8pQHfeGJ91im4Fp8AFPl4Y7ZzaPGqH01FDk64FXivM/Fp6gwSbHcN?=
 =?us-ascii?Q?Nb7SCLxeYlTWM6Ws9FnjWgb8ZyKCGwB6Es7DR825XyBtWBJOwuRyIW1h0dTs?=
 =?us-ascii?Q?ixGcZqLiz3MmliJuWM8IVj0zwpeoAXDnnMQY8q5MB5lIct0naU+TkZPJb9E4?=
 =?us-ascii?Q?5RolArB/qjRmTm2anqBFNc//L06QULP7207j29hvELmNBJA46mMjUTbVU5ST?=
 =?us-ascii?Q?UkrTv3BL++Kt+yVtfN5LF2zwgcx87fJB0YWDGVrXvU1peXvj6IVcnNsXlNmH?=
 =?us-ascii?Q?ejFHf0TwadgqZ3qBgJN7DIeKkMN8Tl/G8Ng2GCU3QYgpyRFgouX3zm+pnJjn?=
 =?us-ascii?Q?7aInvAa/5owMzE0nQJ+79OYFQKgpz+xayPxu0LTJ4/VEl8cH9Pwst2qg2VmD?=
 =?us-ascii?Q?IDTON8MstC/X3ZZJJpC48O+uQcrSHVxEx2NZqTyHlntj8PVjrNXmFq8VE4i3?=
 =?us-ascii?Q?yx/RTJTfE439Z++J6IkIfnbraSwjL++doYvUA5DpPEXc96hfp301M7SboUnK?=
 =?us-ascii?Q?+F97G6/r+r2w104AW+Re64hYs4gfnEQD0NF7pyYCTEmP+m41RomnsFSvollY?=
 =?us-ascii?Q?eKgfZw5F6uNYYH3NrSB6eYr0j4ALOBzoECCdjc2vQJBwrbO056a6O5ftV0pY?=
 =?us-ascii?Q?Qi5/rmRdqM+soRmay725ISovhZp772QsFlM7vfrcEEQt/UAl2gi1M/+7H6Kb?=
 =?us-ascii?Q?iGCopeqZ8KT0JLYxRWnw0+WOnKTQV6sI2rNTzZje2JR6qWqlP+M6PhxwAqdG?=
 =?us-ascii?Q?lPASOV/U4biJAbTjex10C1dOYwLgBXt32mubFFtY/SLwROa+HPNwhajgYVrp?=
 =?us-ascii?Q?lgJAaYm4FHaNo4Q2jh6f3L8JXsvcn7XW9kaa/Ht3u1yTNJAh3FTM8K3cxAPS?=
 =?us-ascii?Q?+ZiJoWYcD34uUMM2sIbHSq7edsHg2j8n0BIILeAn6vyOCVlJPKVa1WW2H54B?=
 =?us-ascii?Q?Pzg//eMGvLBcG3ytm22BzTKd9PwJIeuUo7lRuRny9YmrUpkBR0WhMPpacYp4?=
 =?us-ascii?Q?EnBmxP2U03NqyuvVQGYwxi45PlZAR09ZH70MJO8Fb9WAabafjRuz3CTn0s96?=
 =?us-ascii?Q?dIytTFZ2NjtDsfOOGgHSWO3WhYdX+Hno+O4XZghLF7JiaRw4sxm7GGFR6Yhc?=
 =?us-ascii?Q?uEfvv0UP/ZAkFHXbhbw0TOM=3D?=
Content-Type: multipart/mixed;
	boundary="_004_SJ1PR11MB6129BF5151577F93D523A6F4EBD99SJ1PR11MB6129namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0611f769-5e4a-4cb8-790c-08db0a6845f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 06:38:36.9689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r7gLw2Nt7q4UTn/uMukLvSU6zKstFDKh2KbAErLvuZidnx76b35nict9Z8EepLV/zhelt/28M9RwA5wBOOH2hAIoHSRZ0fsFNL1kR9JEE1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6356
X-Proofpoint-GUID: a0jIUjkhIXmF9z1GKVRAJpgHc6DCg5vq
X-Proofpoint-ORIG-GUID: iGMqSfBTSNBAhn6cdypIapWY6mcEL2ka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_04,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 mlxscore=0
 spamscore=0 mlxlogscore=549 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302090061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 06:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176916

--_004_SJ1PR11MB6129BF5151577F93D523A6F4EBD99SJ1PR11MB6129namp_
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB6129BF5151577F93D523A6F4EBD99SJ1PR11MB6129namp_"

--_000_SJ1PR11MB6129BF5151577F93D523A6F4EBD99SJ1PR11MB6129namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I got the following error while logging in to qemu for Rust Oe-Selftest for=
 x86 target:

2023-02-07 04:09:21,688 - oe-selftest - INFO - Traceback (most recent call =
last):

  File "/ala-lpggp31/yshinde/rust-oe/poky/meta/lib/oeqa/selftest/cases/rust=
.py", line 29, in test_rust
    ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage1-too=
ls-bin/remote-test-server","~/")
  File "/ala-lpggp31/yshinde/rust-oe/poky/meta/lib/oeqa/utils/sshcontrol.py=
", line 156, in copy_to
    return self._internal_run(command, ignore_status=3DFalse)
  File "/ala-lpggp31/yshinde/rust-oe/poky/meta/lib/oeqa/utils/sshcontrol.py=
", line 132, in _internal_run
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, status, output))
AssertionError: Command '['scp', '-o', 'UserKnownHostsFile=3D/dev/null', '-=
o', 'StrictHostKeyChecking=3Dno', '-o', 'LogLevel=3DERROR', '/ala-lpggp31/y=
shinde/rust-oe/poky/build-st/tmp/work/core2-32-poky-linux/rust/1.67.0-r0/ru=
stc-1.67.0-src/build/x86_64-unknown-linux-gnu/stage1-tools-bin/remote-test-=
server', 'root@192.168.7.2:~/']' returned non-zero exit status 1:
b'ssh: connect to host 192.168.7.2 port 22: Connection refused\r\nlost conn=
ection'

runqemu - INFO - Host uptime: 4269209.76

Waiting at most 1000 seconds for login banner (02/07/23 04:06:35)
Connection from 127.0.0.1:55320
Reached login banner in 46.25083827972412 seconds (02/07/23 04:07:21, 16757=
71641.4426777)
Couldn't login into serial console as root using blank password

The output:
Poky (Yocto Project Reference Distro) 4.1+snapshot-edb60ef6fd49764174d140cc=
ae04fca65db131e0 qemux86 /dev/ttyS1
qemux86 login: <<< run_serial(): command timed out after 120 seconds withou=
t output >>>


The Rust Oe-selftest terminates after this and it happens only with the x86=
 target. Any particular reason for this behaviour? I have attached oe-selft=
est-results (complete log file) of the Rust oe-selftest.
While analysing, I found a topic related to this in oe-core-
https://lists.openembedded.org/g/openembedded-core/topic/82536316
What is the final conclusion or fix here? (I am a bit confused here.)

The patch for Rust Oe-Selftest implementation can be found here:
https://lists.openembedded.org/g/openembedded-core/topic/93454351

Let me know if I am missing anything.


Regards,
Yash


--_000_SJ1PR11MB6129BF5151577F93D523A6F4EBD99SJ1PR11MB6129namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Mangal;
	panose-1:2 4 5 3 5 2 3 3 2 2;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I got the following error while logging in to qemu f=
or Rust Oe-Selftest for
<b>x86 target</b>:<br>
<br>
</p>
<p class=3D"MsoNormal">2023-02-07 04:09:21,688 - oe-selftest - INFO - Trace=
back (most recent call last):<br>
<br>
</p>
<p class=3D"MsoNormal">&nbsp; File &quot;/ala-lpggp31/yshinde/rust-oe/poky/=
meta/lib/oeqa/selftest/cases/rust.py&quot;, line 29, in test_rust</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; ssh.copy_to(builddir + &quot;/&qu=
ot; + &quot;build/x86_64-unknown-linux-gnu/stage1-tools-bin/remote-test-ser=
ver&quot;,&quot;~/&quot;)</p>
<p class=3D"MsoNormal">&nbsp; File &quot;/ala-lpggp31/yshinde/rust-oe/poky/=
meta/lib/oeqa/utils/sshcontrol.py&quot;, line 156, in copy_to</p>
<p class=3D"MsoNormal">&nbsp; &nbsp;&nbsp;return self._internal_run(command=
, ignore_status=3DFalse)</p>
<p class=3D"MsoNormal">&nbsp; File &quot;/ala-lpggp31/yshinde/rust-oe/poky/=
meta/lib/oeqa/utils/sshcontrol.py&quot;, line 132, in _internal_run</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; raise AssertionError(&quot;Comman=
d '%s' returned non-zero exit status %d:\n%s&quot; % (command, status, outp=
ut))</p>
<p class=3D"MsoNormal">AssertionError: Command '['scp', '-o', 'UserKnownHos=
tsFile=3D/dev/null', '-o', 'StrictHostKeyChecking=3Dno', '-o', 'LogLevel=3D=
ERROR', '/ala-lpggp31/yshinde/rust-oe/poky/build-st/tmp/work/core2-32-poky-=
linux/rust/1.67.0-r0/rustc-1.67.0-src/build/x86_64-unknown-linux-gnu/stage1=
-tools-bin/remote-test-server',
 'root@192.168.7.2:~/']' returned non-zero exit status 1:</p>
<p class=3D"MsoNormal"><b>b'ssh: connect to host 192.168.7.2 port 22: Conne=
ction refused\r\nlost connection'</b><br>
<br>
runqemu - INFO - Host uptime: 4269209.76<br>
<br>
</p>
<p class=3D"MsoNormal">Waiting at most 1000 seconds for login banner (02/07=
/23 04:06:35)</p>
<p class=3D"MsoNormal">Connection from 127.0.0.1:55320</p>
<p class=3D"MsoNormal">Reached login banner in 46.25083827972412 seconds (0=
2/07/23 04:07:21, 1675771641.4426777)</p>
<p class=3D"MsoNormal"><b>Couldn't login into serial console as root using =
blank password<o:p></o:p></b></p>
<p class=3D"MsoNormal"><br>
The output:</p>
<p class=3D"MsoNormal">Poky (Yocto Project Reference Distro) 4.1+snapshot-e=
db60ef6fd49764174d140ccae04fca65db131e0 qemux86 /dev/ttyS1</p>
<p class=3D"MsoNormal"><b>qemux86 login: &lt;&lt;&lt; run_serial(): command=
 timed out after 120 seconds without output &gt;&gt;&gt;</b><br>
<br>
<br>
The Rust Oe-selftest terminates after this and it happens only with the x86=
 target. Any particular reason for this behaviour? I have attached
<b>oe-selftest-results</b> (complete log file) of the Rust oe-selftest. <br=
>
While analysing, I found a topic related to this in oe-core-</p>
<p class=3D"MsoNormal"><a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/topic/82536316">https://lists.openembedded.org/g/openembedded-cor=
e/topic/82536316</a>
<br>
What is the final conclusion or fix here? (I am a bit confused here.)</p>
<p class=3D"MsoNormal"><br>
The patch for Rust Oe-Selftest implementation can be found here:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/9345435=
1">https://lists.openembedded.org/g/openembedded-core/topic/93454351</a>
<br>
<br>
Let me know if I am missing anything.<br>
<br>
<br>
</p>
<p class=3D"MsoNormal">Regards,<br>
Yash<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ1PR11MB6129BF5151577F93D523A6F4EBD99SJ1PR11MB6129namp_--

--_004_SJ1PR11MB6129BF5151577F93D523A6F4EBD99SJ1PR11MB6129namp_
Content-Type: application/octet-stream; name="oe-selftest-results"
Content-Description: oe-selftest-results
Content-Disposition: attachment; filename="oe-selftest-results"; size=14575;
	creation-date="Thu, 09 Feb 2023 06:27:18 GMT";
	modification-date="Thu, 09 Feb 2023 06:27:18 GMT"
Content-Transfer-Encoding: base64

MjAyMy0wMi0wNyAwMzoyNDo1MCwxNDcgLSBvZS1zZWxmdGVzdCAtIElORk8gLSBDaGFuZ2luZyBj
d2QgdG8gL2FsYS1scGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L2J1aWxkCjIwMjMtMDItMDcg
MDM6MjQ6NTAsMTQ4IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gQWRkaW5nIGxheWVyIGxpYnJhcmll
czoKMjAyMy0wMi0wNyAwMzoyNDo1MCwxNDggLSBvZS1zZWxmdGVzdCAtIElORk8gLSAJL2FsYS1s
cGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L21ldGEvbGliCjIwMjMtMDItMDcgMDM6MjQ6NTAs
MTQ4IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gCS9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2Uv
cG9reS9tZXRhLXlvY3RvLWJzcC9saWIKMjAyMy0wMi0wNyAwMzoyNDo1MCwxNDggLSBvZS1zZWxm
dGVzdCAtIElORk8gLSAJL2FsYS1scGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L21ldGEtc2Vs
ZnRlc3QvbGliCjIwMjMtMDItMDcgMDM6MjQ6NTAsMTQ5IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0g
UnVubmluZyBiaXRiYWtlIC1lIHRvIHRlc3QgdGhlIGNvbmZpZ3VyYXRpb24gaXMgdmFsaWQvcGFy
c2FibGUKMjAyMy0wMi0wNyAwMzoyNDo1NCw3MTIgLSBvZS1zZWxmdGVzdCAtIElORk8gLSBBZGRp
bmc6ICJpbmNsdWRlIHNlbGZ0ZXN0LmluYyIgaW4gL2FsYS1scGdncDMxL3lzaGluZGUvcnVzdC1v
ZS9wb2t5L2J1aWxkLXN0L2NvbmYvbG9jYWwuY29uZgoyMDIzLTAyLTA3IDAzOjI0OjU0LDcxMyAt
IG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIEFkZGluZzogImluY2x1ZGUgYmJsYXllcnMuaW5jIiBpbiBi
YmxheWVycy5jb25mCjIwMjMtMDItMDcgMDM6MjQ6NTQsNzEzIC0gb2Utc2VsZnRlc3QgLSBJTkZP
IC0gdGVzdF9ydXN0IChydXN0LlJ1c3RTZWxmVGVzdFN5c3RlbUVtdWxhdGVkKQoyMDIzLTAyLTA3
IDA0OjA5OjIxLDYzNyAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtICAuLi4gRkFJTAoyMDIzLTAyLTA3
IDA0OjA5OjIxLDY4NyAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIFRyYWNlYmFjayAobW9zdCByZWNl
bnQgY2FsbCBsYXN0KToKICBGaWxlICIvYWxhLWxwZ2dwMzEveXNoaW5kZS9ydXN0LW9lL3Bva3kv
bWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9ydXN0LnB5IiwgbGluZSAyOSwgaW4gdGVzdF9y
dXN0CiAgICBzc2guY29weV90byhidWlsZGRpciArICIvIiArICJidWlsZC94ODZfNjQtdW5rbm93
bi1saW51eC1nbnUvc3RhZ2UxLXRvb2xzLWJpbi9yZW1vdGUtdGVzdC1zZXJ2ZXIiLCJ+LyIpCiAg
RmlsZSAiL2FsYS1scGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L21ldGEvbGliL29lcWEvdXRp
bHMvc3NoY29udHJvbC5weSIsIGxpbmUgMTU2LCBpbiBjb3B5X3RvCiAgICByZXR1cm4gc2VsZi5f
aW50ZXJuYWxfcnVuKGNvbW1hbmQsIGlnbm9yZV9zdGF0dXM9RmFsc2UpCiAgRmlsZSAiL2FsYS1s
cGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L21ldGEvbGliL29lcWEvdXRpbHMvc3NoY29udHJv
bC5weSIsIGxpbmUgMTMyLCBpbiBfaW50ZXJuYWxfcnVuCiAgICByYWlzZSBBc3NlcnRpb25FcnJv
cigiQ29tbWFuZCAnJXMnIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzICVkOlxuJXMiICUg
KGNvbW1hbmQsIHN0YXR1cywgb3V0cHV0KSkKQXNzZXJ0aW9uRXJyb3I6IENvbW1hbmQgJ1snc2Nw
JywgJy1vJywgJ1VzZXJLbm93bkhvc3RzRmlsZT0vZGV2L251bGwnLCAnLW8nLCAnU3RyaWN0SG9z
dEtleUNoZWNraW5nPW5vJywgJy1vJywgJ0xvZ0xldmVsPUVSUk9SJywgJy9hbGEtbHBnZ3AzMS95
c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC90bXAvd29yay9jb3JlMi0zMi1wb2t5LWxpbnV4
L3J1c3QvMS42Ny4wLXIwL3J1c3RjLTEuNjcuMC1zcmMvYnVpbGQveDg2XzY0LXVua25vd24tbGlu
dXgtZ251L3N0YWdlMS10b29scy1iaW4vcmVtb3RlLXRlc3Qtc2VydmVyJywgJ3Jvb3RAMTkyLjE2
OC43LjI6fi8nXScgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMToKYidzc2g6IGNvbm5l
Y3QgdG8gaG9zdCAxOTIuMTY4LjcuMiBwb3J0IDIyOiBDb25uZWN0aW9uIHJlZnVzZWRcclxubG9z
dCBjb25uZWN0aW9uJwoKU3Rkb3V0OgpMb2FkaW5nIGNhY2hlLi4uZG9uZS4Kcm9vdGZzIGZpbGU6
IC9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC90bXAvZGVwbG95L2lt
YWdlcy9xZW11eDg2L2NvcmUtaW1hZ2UtbWluaW1hbC1xZW11eDg2LmV4dDQKUWVtdSBsb2cgZmls
ZTogL2FsYS1scGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L2J1aWxkLXN0L3RtcC93b3JrL3Fl
bXV4ODYtcG9reS1saW51eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wLXIwL3Rlc3RpbWFnZS9xZW11
X2Jvb3RfbG9nLjIwMjMwMjA3MTIwNjMyClNTSCBsb2cgZmlsZTogL2FsYS1scGdncDMxL3lzaGlu
ZGUvcnVzdC1vZS9wb2t5L2J1aWxkLXN0L3RtcC93b3JrL3FlbXV4ODYtcG9reS1saW51eC9jb3Jl
LWltYWdlLW1pbmltYWwvMS4wLXIwL3Rlc3RpbWFnZS9zc2hfdGFyZ2V0X2xvZy4yMDIzMDIwNzEy
MDYzMgpOb3QgdXNpbmcga3ZtIGZvciBydW5xZW11ClFNUCBBdmFpbGFibGUgZm9yIGNvbm5lY3Rp
b24gYXQgL2FsYS1scGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L2J1aWxkLXN0L3RtcC8uN2Fv
N2l4M2sKQ3JlYXRlZCBsaXN0ZW5pbmcgc29ja2V0IGZvciBxZW11IHNlcmlhbCBjb25zb2xlIG9u
OiAxMjcuMC4wLjE6NDc3OTMKQ3JlYXRlZCBsaXN0ZW5pbmcgc29ja2V0IGZvciBxZW11IHNlcmlh
bCBjb25zb2xlIG9uOiAxMjcuMC4wLjE6NTAwNjMKbGF1bmNoY21kPXJ1bnFlbXUgc25hcHNob3Qg
bm9ncmFwaGljIG5vZ3JhcGhpYyBxZW11eDg2IC9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2Uv
cG9reS9idWlsZC1zdC90bXAvZGVwbG95L2ltYWdlcy9xZW11eDg2L2NvcmUtaW1hZ2UtbWluaW1h
bC1xZW11eDg2LmV4dDQgdGNwc2VyaWFsPTQ3NzkzOjUwMDYzIGJvb3RwYXJhbXM9IiBwcmludGsu
dGltZT0xIiBxZW11cGFyYW1zPSItcGlkZmlsZSAvYWxhLWxwZ2dwMzEveXNoaW5kZS9ydXN0LW9l
L3Bva3kvYnVpbGQtc3QvcGlkZmlsZV81Nzc5NjAgIC1TIC1xbXAgdW5peDouLy5ldm4yNHh5eixz
ZXJ2ZXIsd2FpdCAtcW1wIHVuaXg6Li8uN2FvN2l4M2ssc2VydmVyLG5vd2FpdCAtbSA1MTIgIgpy
dW5xZW11IHN0YXJ0ZWQsIHBpZCBpcyAzNDcxNjMxCndhaXRpbmcgYXQgbW9zdCAzMDAgc2Vjb25k
cyBmb3IgcWVtdSBwaWQgKDAyLzA3LzIzIDA0OjA2OjM0KQpRTVAgSW5pdGlhbGl6aW5nIHRvIC9h
bGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC90bXAvLmV2bjI0eHl6ClFN
UCBDb25uZWN0aW5nIHRvIC9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1z
dC90bXAvLmV2bjI0eHl6ClFNUCBjb25uZWN0ZWQgdG8gUUVNVSBhdCAwMi8wNy8yMyAwNDowNjoz
NSBhbmQgdG9vayAwLjU0OTAzOTM2Mzg2MTA4NCBzZWNvbmRzClFNUCByZWxlYXNlZCBRRU1VIGF0
IDAyLzA3LzIzIDA0OjA2OjM1IGFuZCB0b29rIDAuMDkxODkyMDA0MDEzMDYxNTIgc2Vjb25kcyBm
cm9tIGNvbm5lY3QKcWVtdSBzdGFydGVkIGluIDAuNjM4ODMzOTk5NjMzNzg5MSBzZWNvbmRzIC0g
cWVtdSBwcm9jY2VzIHBpZCBpcyAzNDcxNjM0ICgwMi8wNy8yMyAwNDowNjozNSkKcWVtdSBjbWRs
aW5lIHVzZWQ6Ci9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC90bXAv
d29yay94ODZfNjQtbGludXgvcWVtdS1oZWxwZXItbmF0aXZlLzEuMC1yMS9yZWNpcGUtc3lzcm9v
dC1uYXRpdmUvdXNyL2Jpbi9xZW11LXN5c3RlbS1pMzg2IC1kZXZpY2UgdmlydGlvLW5ldC1wY2ks
bmV0ZGV2PW5ldDAsbWFjPTUyOjU0OjAwOjEyOjM0OjAyIC1uZXRkZXYgdGFwLGlkPW5ldDAsaWZu
YW1lPXRhcDAsc2NyaXB0PW5vLGRvd25zY3JpcHQ9bm8gLW9iamVjdCBybmctcmFuZG9tLGZpbGVu
YW1lPS9kZXYvdXJhbmRvbSxpZD1ybmcwIC1kZXZpY2UgdmlydGlvLXJuZy1wY2kscm5nPXJuZzAg
LWRyaXZlIGZpbGU9L2FsYS1scGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L2J1aWxkLXN0L3Rt
cC9kZXBsb3kvaW1hZ2VzL3FlbXV4ODYvY29yZS1pbWFnZS1taW5pbWFsLXFlbXV4ODYuZXh0NCxp
Zj12aXJ0aW8sZm9ybWF0PXJhdyAtdXNiIC1kZXZpY2UgdXNiLXRhYmxldCAtdXNiIC1kZXZpY2Ug
dXNiLWtiZCAtY3B1IEl2eUJyaWRnZSAtbWFjaGluZSBxMzUsaTgwNDI9b2ZmIC1zbXAgNCAtbSA1
MTIgLXNlcmlhbCB0Y3A6MTI3LjAuMC4xOjQ3NzkzIC1zZXJpYWwgdGNwOjEyNy4wLjAuMTo1MDA2
MyAtcGlkZmlsZSAvYWxhLWxwZ2dwMzEveXNoaW5kZS9ydXN0LW9lL3Bva3kvYnVpbGQtc3QvcGlk
ZmlsZV81Nzc5NjAgLVMgLXFtcCB1bml4Oi4vLmV2bjI0eHl6LHNlcnZlcix3YWl0IC1xbXAgdW5p
eDouLy43YW83aXgzayxzZXJ2ZXIsbm93YWl0IC1tIDUxMiAtc25hcHNob3QgLXNlcmlhbCBtb246
c3RkaW8gLW5vZ3JhcGhpYyAta2VybmVsIC9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9r
eS9idWlsZC1zdC90bXAvZGVwbG95L2ltYWdlcy9xZW11eDg2L2J6SW1hZ2UgLWFwcGVuZCByb290
PS9kZXYvdmRhIHJ3ICBpcD0xOTIuMTY4LjcuMjo6MTkyLjE2OC43LjE6MjU1LjI1NS4yNTUuMDo6
ZXRoMDpvZmY6OC44LjguOCBjb25zb2xlPXR0eVMwIGNvbnNvbGU9dHR5UzEgb3Byb2ZpbGUudGlt
ZXI9MSB0c2M9cmVsaWFibGUgbm9fdGltZXJfY2hlY2sgcmN1cGRhdGUucmN1X2V4cGVkaXRlZD0x
ICBwcmludGsudGltZT0xIApUYXJnZXQgSVA6IDE5Mi4xNjguNy4yClNlcnZlciBJUDogMTkyLjE2
OC43LjEKU3RhcnRpbmcgbG9nZ2luZyB0aHJlYWQKU3RhcnRpbmcgdGhyZWFkIGV2ZW50IGxvb3AK
Q29ubmVjdGlvbiByZXF1ZXN0IHJlY2VpdmVkClNldHRpbmcgY29ubmVjdGlvbiBlc3RhYmxpc2hl
ZCBldmVudApPdXRwdXQgZnJvbSBydW5xZW11OgpydW5xZW11IC0gSU5GTyAtIENvbnRpbnVpbmcg
d2l0aCB0aGUgZm9sbG93aW5nIHBhcmFtZXRlcnM6CktFUk5FTDogWy9hbGEtbHBnZ3AzMS95c2hp
bmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC90bXAvZGVwbG95L2ltYWdlcy9xZW11eDg2L2J6SW1h
Z2VdCk1BQ0hJTkU6IFtxZW11eDg2XQpGU1RZUEU6IFtleHQ0XQpST09URlM6IFsvYWxhLWxwZ2dw
MzEveXNoaW5kZS9ydXN0LW9lL3Bva3kvYnVpbGQtc3QvdG1wL2RlcGxveS9pbWFnZXMvcWVtdXg4
Ni9jb3JlLWltYWdlLW1pbmltYWwtcWVtdXg4Ni5leHQ0XQpDT05GRklMRTogWy9hbGEtbHBnZ3Az
MS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC90bXAvZGVwbG95L2ltYWdlcy9xZW11eDg2
L2NvcmUtaW1hZ2UtbWluaW1hbC1xZW11eDg2LnFlbXVib290LmNvbmZdCgpydW5xZW11IC0gSU5G
TyAtIFVzaW5nIHByZWNvbmZpZ3VyZWQgdGFwIGRldmljZSB0YXAwCnJ1bnFlbXUgLSBJTkZPIC0g
SWYgdGhpcyBpcyBub3QgaW50ZW5kZWQsIHRvdWNoIC90bXAvcWVtdS10YXAtbG9ja3MvdGFwMC5z
a2lwIHRvIG1ha2UgcnVucWVtdSBza2lwIHRhcDAuCnJ1bnFlbXUgLSBJTkZPIC0gTmV0d29yayBj
b25maWd1cmF0aW9uOiBpcD0xOTIuMTY4LjcuMjo6MTkyLjE2OC43LjE6MjU1LjI1NS4yNTUuMDo6
ZXRoMDpvZmY6OC44LjguOApydW5xZW11IC0gSU5GTyAtIFJ1bm5pbmcgL2FsYS1scGdncDMxL3lz
aGluZGUvcnVzdC1vZS9wb2t5L2J1aWxkLXN0L3RtcC93b3JrL3g4Nl82NC1saW51eC9xZW11LWhl
bHBlci1uYXRpdmUvMS4wLXIxL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL3FlbXUtc3lz
dGVtLWkzODYgLWRldmljZSB2aXJ0aW8tbmV0LXBjaSxuZXRkZXY9bmV0MCxtYWM9NTI6NTQ6MDA6
MTI6MzQ6MDIgLW5ldGRldiB0YXAsaWQ9bmV0MCxpZm5hbWU9dGFwMCxzY3JpcHQ9bm8sZG93bnNj
cmlwdD1ubyAtb2JqZWN0IHJuZy1yYW5kb20sZmlsZW5hbWU9L2Rldi91cmFuZG9tLGlkPXJuZzAg
LWRldmljZSB2aXJ0aW8tcm5nLXBjaSxybmc9cm5nMCAtZHJpdmUgZmlsZT0vYWxhLWxwZ2dwMzEv
eXNoaW5kZS9ydXN0LW9lL3Bva3kvYnVpbGQtc3QvdG1wL2RlcGxveS9pbWFnZXMvcWVtdXg4Ni9j
b3JlLWltYWdlLW1pbmltYWwtcWVtdXg4Ni5leHQ0LGlmPXZpcnRpbyxmb3JtYXQ9cmF3IC11c2Ig
LWRldmljZSB1c2ItdGFibGV0IC11c2IgLWRldmljZSB1c2Ita2JkICAgLWNwdSBJdnlCcmlkZ2Ug
LW1hY2hpbmUgcTM1LGk4MDQyPW9mZiAtc21wIDQgLW0gNTEyIC1zZXJpYWwgdGNwOjEyNy4wLjAu
MTo0Nzc5MyAtc2VyaWFsIHRjcDoxMjcuMC4wLjE6NTAwNjMgIC1waWRmaWxlIC9hbGEtbHBnZ3Az
MS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC9waWRmaWxlXzU3Nzk2MCAgLVMgLXFtcCB1
bml4Oi4vLmV2bjI0eHl6LHNlcnZlcix3YWl0IC1xbXAgdW5peDouLy43YW83aXgzayxzZXJ2ZXIs
bm93YWl0IC1tIDUxMiAgLXNuYXBzaG90IC1zZXJpYWwgbW9uOnN0ZGlvIC1ub2dyYXBoaWMgIC1r
ZXJuZWwgL2FsYS1scGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L2J1aWxkLXN0L3RtcC9kZXBs
b3kvaW1hZ2VzL3FlbXV4ODYvYnpJbWFnZSAtYXBwZW5kICdyb290PS9kZXYvdmRhIHJ3ICBpcD0x
OTIuMTY4LjcuMjo6MTkyLjE2OC43LjE6MjU1LjI1NS4yNTUuMDo6ZXRoMDpvZmY6OC44LjguOCBj
b25zb2xlPXR0eVMwIGNvbnNvbGU9dHR5UzEgb3Byb2ZpbGUudGltZXI9MSB0c2M9cmVsaWFibGUg
bm9fdGltZXJfY2hlY2sgcmN1cGRhdGUucmN1X2V4cGVkaXRlZD0xICBwcmludGsudGltZT0xJwoK
cnVucWVtdSAtIElORk8gLSBIb3N0IHVwdGltZTogNDI2OTIwOS43NgoKCldhaXRpbmcgYXQgbW9z
dCAxMDAwIHNlY29uZHMgZm9yIGxvZ2luIGJhbm5lciAoMDIvMDcvMjMgMDQ6MDY6MzUpCkNvbm5l
Y3Rpb24gZnJvbSAxMjcuMC4wLjE6NTUzMjAKUmVhY2hlZCBsb2dpbiBiYW5uZXIgaW4gNDYuMjUw
ODM4Mjc5NzI0MTIgc2Vjb25kcyAoMDIvMDcvMjMgMDQ6MDc6MjEsIDE2NzU3NzE2NDEuNDQyNjc3
NykKQ291bGRuJ3QgbG9naW4gaW50byBzZXJpYWwgY29uc29sZSBhcyByb290IHVzaW5nIGJsYW5r
IHBhc3N3b3JkClRoZSBvdXRwdXQ6Cg0NClBva3kgKFlvY3RvIFByb2plY3QgUmVmZXJlbmNlIERp
c3RybykgNC4xK3NuYXBzaG90LWVkYjYwZWY2ZmQ0OTc2NDE3NGQxNDBjY2FlMDRmY2E2NWRiMTMx
ZTAgcWVtdXg4NiAvZGV2L3R0eVMxDQoNDQoNcWVtdXg4NiBsb2dpbjogPDw8IHJ1bl9zZXJpYWwo
KTogY29tbWFuZCB0aW1lZCBvdXQgYWZ0ZXIgMTIwIHNlY29uZHMgd2l0aG91dCBvdXRwdXQgPj4+
DQoNCgoKMjAyMy0wMi0wNyAwNDowOToyMSw2ODggLSBvZS1zZWxmdGVzdCAtIElORk8gLSA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09CjIwMjMtMDItMDcgMDQ6MDk6MjEsNjg4IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0g
RkFJTDogdGVzdF9ydXN0IChydXN0LlJ1c3RTZWxmVGVzdFN5c3RlbUVtdWxhdGVkKQoyMDIzLTAy
LTA3IDA0OjA5OjIxLDY4OCAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KMjAy
My0wMi0wNyAwNDowOToyMSw2ODggLSBvZS1zZWxmdGVzdCAtIElORk8gLSBUcmFjZWJhY2sgKG1v
c3QgcmVjZW50IGNhbGwgbGFzdCk6CiAgRmlsZSAiL2FsYS1scGdncDMxL3lzaGluZGUvcnVzdC1v
ZS9wb2t5L21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvcnVzdC5weSIsIGxpbmUgMjksIGlu
IHRlc3RfcnVzdAogICAgc3NoLmNvcHlfdG8oYnVpbGRkaXIgKyAiLyIgKyAiYnVpbGQveDg2XzY0
LXVua25vd24tbGludXgtZ251L3N0YWdlMS10b29scy1iaW4vcmVtb3RlLXRlc3Qtc2VydmVyIiwi
fi8iKQogIEZpbGUgIi9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9reS9tZXRhL2xpYi9v
ZXFhL3V0aWxzL3NzaGNvbnRyb2wucHkiLCBsaW5lIDE1NiwgaW4gY29weV90bwogICAgcmV0dXJu
IHNlbGYuX2ludGVybmFsX3J1bihjb21tYW5kLCBpZ25vcmVfc3RhdHVzPUZhbHNlKQogIEZpbGUg
Ii9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9reS9tZXRhL2xpYi9vZXFhL3V0aWxzL3Nz
aGNvbnRyb2wucHkiLCBsaW5lIDEzMiwgaW4gX2ludGVybmFsX3J1bgogICAgcmFpc2UgQXNzZXJ0
aW9uRXJyb3IoIkNvbW1hbmQgJyVzJyByZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAlZDpc
biVzIiAlIChjb21tYW5kLCBzdGF0dXMsIG91dHB1dCkpCkFzc2VydGlvbkVycm9yOiBDb21tYW5k
ICdbJ3NjcCcsICctbycsICdVc2VyS25vd25Ib3N0c0ZpbGU9L2Rldi9udWxsJywgJy1vJywgJ1N0
cmljdEhvc3RLZXlDaGVja2luZz1ubycsICctbycsICdMb2dMZXZlbD1FUlJPUicsICcvYWxhLWxw
Z2dwMzEveXNoaW5kZS9ydXN0LW9lL3Bva3kvYnVpbGQtc3QvdG1wL3dvcmsvY29yZTItMzItcG9r
eS1saW51eC9ydXN0LzEuNjcuMC1yMC9ydXN0Yy0xLjY3LjAtc3JjL2J1aWxkL3g4Nl82NC11bmtu
b3duLWxpbnV4LWdudS9zdGFnZTEtdG9vbHMtYmluL3JlbW90ZS10ZXN0LXNlcnZlcicsICdyb290
QDE5Mi4xNjguNy4yOn4vJ10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDE6CmInc3No
OiBjb25uZWN0IHRvIGhvc3QgMTkyLjE2OC43LjIgcG9ydCAyMjogQ29ubmVjdGlvbiByZWZ1c2Vk
XHJcbmxvc3QgY29ubmVjdGlvbicKClN0ZG91dDoKTG9hZGluZyBjYWNoZS4uLmRvbmUuCnJvb3Rm
cyBmaWxlOiAvYWxhLWxwZ2dwMzEveXNoaW5kZS9ydXN0LW9lL3Bva3kvYnVpbGQtc3QvdG1wL2Rl
cGxveS9pbWFnZXMvcWVtdXg4Ni9jb3JlLWltYWdlLW1pbmltYWwtcWVtdXg4Ni5leHQ0ClFlbXUg
bG9nIGZpbGU6IC9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC90bXAv
d29yay9xZW11eDg2LXBva3ktbGludXgvY29yZS1pbWFnZS1taW5pbWFsLzEuMC1yMC90ZXN0aW1h
Z2UvcWVtdV9ib290X2xvZy4yMDIzMDIwNzEyMDYzMgpTU0ggbG9nIGZpbGU6IC9hbGEtbHBnZ3Az
MS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC90bXAvd29yay9xZW11eDg2LXBva3ktbGlu
dXgvY29yZS1pbWFnZS1taW5pbWFsLzEuMC1yMC90ZXN0aW1hZ2Uvc3NoX3RhcmdldF9sb2cuMjAy
MzAyMDcxMjA2MzIKTm90IHVzaW5nIGt2bSBmb3IgcnVucWVtdQpRTVAgQXZhaWxhYmxlIGZvciBj
b25uZWN0aW9uIGF0IC9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC90
bXAvLjdhbzdpeDNrCkNyZWF0ZWQgbGlzdGVuaW5nIHNvY2tldCBmb3IgcWVtdSBzZXJpYWwgY29u
c29sZSBvbjogMTI3LjAuMC4xOjQ3NzkzCkNyZWF0ZWQgbGlzdGVuaW5nIHNvY2tldCBmb3IgcWVt
dSBzZXJpYWwgY29uc29sZSBvbjogMTI3LjAuMC4xOjUwMDYzCmxhdW5jaGNtZD1ydW5xZW11IHNu
YXBzaG90IG5vZ3JhcGhpYyBub2dyYXBoaWMgcWVtdXg4NiAvYWxhLWxwZ2dwMzEveXNoaW5kZS9y
dXN0LW9lL3Bva3kvYnVpbGQtc3QvdG1wL2RlcGxveS9pbWFnZXMvcWVtdXg4Ni9jb3JlLWltYWdl
LW1pbmltYWwtcWVtdXg4Ni5leHQ0IHRjcHNlcmlhbD00Nzc5Mzo1MDA2MyBib290cGFyYW1zPSIg
cHJpbnRrLnRpbWU9MSIgcWVtdXBhcmFtcz0iLXBpZGZpbGUgL2FsYS1scGdncDMxL3lzaGluZGUv
cnVzdC1vZS9wb2t5L2J1aWxkLXN0L3BpZGZpbGVfNTc3OTYwICAtUyAtcW1wIHVuaXg6Li8uZXZu
MjR4eXosc2VydmVyLHdhaXQgLXFtcCB1bml4Oi4vLjdhbzdpeDNrLHNlcnZlcixub3dhaXQgLW0g
NTEyICIKcnVucWVtdSBzdGFydGVkLCBwaWQgaXMgMzQ3MTYzMQp3YWl0aW5nIGF0IG1vc3QgMzAw
IHNlY29uZHMgZm9yIHFlbXUgcGlkICgwMi8wNy8yMyAwNDowNjozNCkKUU1QIEluaXRpYWxpemlu
ZyB0byAvYWxhLWxwZ2dwMzEveXNoaW5kZS9ydXN0LW9lL3Bva3kvYnVpbGQtc3QvdG1wLy5ldm4y
NHh5egpRTVAgQ29ubmVjdGluZyB0byAvYWxhLWxwZ2dwMzEveXNoaW5kZS9ydXN0LW9lL3Bva3kv
YnVpbGQtc3QvdG1wLy5ldm4yNHh5egpRTVAgY29ubmVjdGVkIHRvIFFFTVUgYXQgMDIvMDcvMjMg
MDQ6MDY6MzUgYW5kIHRvb2sgMC41NDkwMzkzNjM4NjEwODQgc2Vjb25kcwpRTVAgcmVsZWFzZWQg
UUVNVSBhdCAwMi8wNy8yMyAwNDowNjozNSBhbmQgdG9vayAwLjA5MTg5MjAwNDAxMzA2MTUyIHNl
Y29uZHMgZnJvbSBjb25uZWN0CnFlbXUgc3RhcnRlZCBpbiAwLjYzODgzMzk5OTYzMzc4OTEgc2Vj
b25kcyAtIHFlbXUgcHJvY2NlcyBwaWQgaXMgMzQ3MTYzNCAoMDIvMDcvMjMgMDQ6MDY6MzUpCnFl
bXUgY21kbGluZSB1c2VkOgovYWxhLWxwZ2dwMzEveXNoaW5kZS9ydXN0LW9lL3Bva3kvYnVpbGQt
c3QvdG1wL3dvcmsveDg2XzY0LWxpbnV4L3FlbXUtaGVscGVyLW5hdGl2ZS8xLjAtcjEvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcWVtdS1zeXN0ZW0taTM4NiAtZGV2aWNlIHZpcnRpby1u
ZXQtcGNpLG5ldGRldj1uZXQwLG1hYz01Mjo1NDowMDoxMjozNDowMiAtbmV0ZGV2IHRhcCxpZD1u
ZXQwLGlmbmFtZT10YXAwLHNjcmlwdD1ubyxkb3duc2NyaXB0PW5vIC1vYmplY3Qgcm5nLXJhbmRv
bSxmaWxlbmFtZT0vZGV2L3VyYW5kb20saWQ9cm5nMCAtZGV2aWNlIHZpcnRpby1ybmctcGNpLHJu
Zz1ybmcwIC1kcml2ZSBmaWxlPS9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWls
ZC1zdC90bXAvZGVwbG95L2ltYWdlcy9xZW11eDg2L2NvcmUtaW1hZ2UtbWluaW1hbC1xZW11eDg2
LmV4dDQsaWY9dmlydGlvLGZvcm1hdD1yYXcgLXVzYiAtZGV2aWNlIHVzYi10YWJsZXQgLXVzYiAt
ZGV2aWNlIHVzYi1rYmQgLWNwdSBJdnlCcmlkZ2UgLW1hY2hpbmUgcTM1LGk4MDQyPW9mZiAtc21w
IDQgLW0gNTEyIC1zZXJpYWwgdGNwOjEyNy4wLjAuMTo0Nzc5MyAtc2VyaWFsIHRjcDoxMjcuMC4w
LjE6NTAwNjMgLXBpZGZpbGUgL2FsYS1scGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L2J1aWxk
LXN0L3BpZGZpbGVfNTc3OTYwIC1TIC1xbXAgdW5peDouLy5ldm4yNHh5eixzZXJ2ZXIsd2FpdCAt
cW1wIHVuaXg6Li8uN2FvN2l4M2ssc2VydmVyLG5vd2FpdCAtbSA1MTIgLXNuYXBzaG90IC1zZXJp
YWwgbW9uOnN0ZGlvIC1ub2dyYXBoaWMgLWtlcm5lbCAvYWxhLWxwZ2dwMzEveXNoaW5kZS9ydXN0
LW9lL3Bva3kvYnVpbGQtc3QvdG1wL2RlcGxveS9pbWFnZXMvcWVtdXg4Ni9iekltYWdlIC1hcHBl
bmQgcm9vdD0vZGV2L3ZkYSBydyAgaXA9MTkyLjE2OC43LjI6OjE5Mi4xNjguNy4xOjI1NS4yNTUu
MjU1LjA6OmV0aDA6b2ZmOjguOC44LjggY29uc29sZT10dHlTMCBjb25zb2xlPXR0eVMxIG9wcm9m
aWxlLnRpbWVyPTEgdHNjPXJlbGlhYmxlIG5vX3RpbWVyX2NoZWNrIHJjdXBkYXRlLnJjdV9leHBl
ZGl0ZWQ9MSAgcHJpbnRrLnRpbWU9MSAKVGFyZ2V0IElQOiAxOTIuMTY4LjcuMgpTZXJ2ZXIgSVA6
IDE5Mi4xNjguNy4xClN0YXJ0aW5nIGxvZ2dpbmcgdGhyZWFkClN0YXJ0aW5nIHRocmVhZCBldmVu
dCBsb29wCkNvbm5lY3Rpb24gcmVxdWVzdCByZWNlaXZlZApTZXR0aW5nIGNvbm5lY3Rpb24gZXN0
YWJsaXNoZWQgZXZlbnQKT3V0cHV0IGZyb20gcnVucWVtdToKcnVucWVtdSAtIElORk8gLSBDb250
aW51aW5nIHdpdGggdGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzOgpLRVJORUw6IFsvYWxhLWxwZ2dw
MzEveXNoaW5kZS9ydXN0LW9lL3Bva3kvYnVpbGQtc3QvdG1wL2RlcGxveS9pbWFnZXMvcWVtdXg4
Ni9iekltYWdlXQpNQUNISU5FOiBbcWVtdXg4Nl0KRlNUWVBFOiBbZXh0NF0KUk9PVEZTOiBbL2Fs
YS1scGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L2J1aWxkLXN0L3RtcC9kZXBsb3kvaW1hZ2Vz
L3FlbXV4ODYvY29yZS1pbWFnZS1taW5pbWFsLXFlbXV4ODYuZXh0NF0KQ09ORkZJTEU6IFsvYWxh
LWxwZ2dwMzEveXNoaW5kZS9ydXN0LW9lL3Bva3kvYnVpbGQtc3QvdG1wL2RlcGxveS9pbWFnZXMv
cWVtdXg4Ni9jb3JlLWltYWdlLW1pbmltYWwtcWVtdXg4Ni5xZW11Ym9vdC5jb25mXQoKcnVucWVt
dSAtIElORk8gLSBVc2luZyBwcmVjb25maWd1cmVkIHRhcCBkZXZpY2UgdGFwMApydW5xZW11IC0g
SU5GTyAtIElmIHRoaXMgaXMgbm90IGludGVuZGVkLCB0b3VjaCAvdG1wL3FlbXUtdGFwLWxvY2tz
L3RhcDAuc2tpcCB0byBtYWtlIHJ1bnFlbXUgc2tpcCB0YXAwLgpydW5xZW11IC0gSU5GTyAtIE5l
dHdvcmsgY29uZmlndXJhdGlvbjogaXA9MTkyLjE2OC43LjI6OjE5Mi4xNjguNy4xOjI1NS4yNTUu
MjU1LjA6OmV0aDA6b2ZmOjguOC44LjgKcnVucWVtdSAtIElORk8gLSBSdW5uaW5nIC9hbGEtbHBn
Z3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC90bXAvd29yay94ODZfNjQtbGludXgv
cWVtdS1oZWxwZXItbmF0aXZlLzEuMC1yMS9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9x
ZW11LXN5c3RlbS1pMzg2IC1kZXZpY2UgdmlydGlvLW5ldC1wY2ksbmV0ZGV2PW5ldDAsbWFjPTUy
OjU0OjAwOjEyOjM0OjAyIC1uZXRkZXYgdGFwLGlkPW5ldDAsaWZuYW1lPXRhcDAsc2NyaXB0PW5v
LGRvd25zY3JpcHQ9bm8gLW9iamVjdCBybmctcmFuZG9tLGZpbGVuYW1lPS9kZXYvdXJhbmRvbSxp
ZD1ybmcwIC1kZXZpY2UgdmlydGlvLXJuZy1wY2kscm5nPXJuZzAgLWRyaXZlIGZpbGU9L2FsYS1s
cGdncDMxL3lzaGluZGUvcnVzdC1vZS9wb2t5L2J1aWxkLXN0L3RtcC9kZXBsb3kvaW1hZ2VzL3Fl
bXV4ODYvY29yZS1pbWFnZS1taW5pbWFsLXFlbXV4ODYuZXh0NCxpZj12aXJ0aW8sZm9ybWF0PXJh
dyAtdXNiIC1kZXZpY2UgdXNiLXRhYmxldCAtdXNiIC1kZXZpY2UgdXNiLWtiZCAgIC1jcHUgSXZ5
QnJpZGdlIC1tYWNoaW5lIHEzNSxpODA0Mj1vZmYgLXNtcCA0IC1tIDUxMiAtc2VyaWFsIHRjcDox
MjcuMC4wLjE6NDc3OTMgLXNlcmlhbCB0Y3A6MTI3LjAuMC4xOjUwMDYzICAtcGlkZmlsZSAvYWxh
LWxwZ2dwMzEveXNoaW5kZS9ydXN0LW9lL3Bva3kvYnVpbGQtc3QvcGlkZmlsZV81Nzc5NjAgIC1T
IC1xbXAgdW5peDouLy5ldm4yNHh5eixzZXJ2ZXIsd2FpdCAtcW1wIHVuaXg6Li8uN2FvN2l4M2ss
c2VydmVyLG5vd2FpdCAtbSA1MTIgIC1zbmFwc2hvdCAtc2VyaWFsIG1vbjpzdGRpbyAtbm9ncmFw
aGljICAta2VybmVsIC9hbGEtbHBnZ3AzMS95c2hpbmRlL3J1c3Qtb2UvcG9reS9idWlsZC1zdC90
bXAvZGVwbG95L2ltYWdlcy9xZW11eDg2L2J6SW1hZ2UgLWFwcGVuZCAncm9vdD0vZGV2L3ZkYSBy
dyAgaXA9MTkyLjE2OC43LjI6OjE5Mi4xNjguNy4xOjI1NS4yNTUuMjU1LjA6OmV0aDA6b2ZmOjgu
OC44LjggY29uc29sZT10dHlTMCBjb25zb2xlPXR0eVMxIG9wcm9maWxlLnRpbWVyPTEgdHNjPXJl
bGlhYmxlIG5vX3RpbWVyX2NoZWNrIHJjdXBkYXRlLnJjdV9leHBlZGl0ZWQ9MSAgcHJpbnRrLnRp
bWU9MScKCnJ1bnFlbXUgLSBJTkZPIC0gSG9zdCB1cHRpbWU6IDQyNjkyMDkuNzYKCgpXYWl0aW5n
IGF0IG1vc3QgMTAwMCBzZWNvbmRzIGZvciBsb2dpbiBiYW5uZXIgKDAyLzA3LzIzIDA0OjA2OjM1
KQpDb25uZWN0aW9uIGZyb20gMTI3LjAuMC4xOjU1MzIwClJlYWNoZWQgbG9naW4gYmFubmVyIGlu
IDQ2LjI1MDgzODI3OTcyNDEyIHNlY29uZHMgKDAyLzA3LzIzIDA0OjA3OjIxLCAxNjc1NzcxNjQx
LjQ0MjY3NzcpCkNvdWxkbid0IGxvZ2luIGludG8gc2VyaWFsIGNvbnNvbGUgYXMgcm9vdCB1c2lu
ZyBibGFuayBwYXNzd29yZApUaGUgb3V0cHV0OgoNDQpQb2t5IChZb2N0byBQcm9qZWN0IFJlZmVy
ZW5jZSBEaXN0cm8pIDQuMStzbmFwc2hvdC1lZGI2MGVmNmZkNDk3NjQxNzRkMTQwY2NhZTA0ZmNh
NjVkYjEzMWUwIHFlbXV4ODYgL2Rldi90dHlTMQ0KDQ0KDXFlbXV4ODYgbG9naW46IDw8PCBydW5f
c2VyaWFsKCk6IGNvbW1hbmQgdGltZWQgb3V0IGFmdGVyIDEyMCBzZWNvbmRzIHdpdGhvdXQgb3V0
cHV0ID4+Pg0KDQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoyMDIzLTAyLTA3IDA0OjA5OjIxLDY4OSAtIG9lLXNl
bGZ0ZXN0IC0gSU5GTyAtIFJhbiAxIHRlc3QgaW4gMjY2OS4zNzJzCjIwMjMtMDItMDcgMDQ6MDk6
MjEsNjg5IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gRkFJTEVECjIwMjMtMDItMDcgMDQ6MDk6MjEs
Njg5IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gIChmYWlsdXJlcz0xKQoyMDIzLTAyLTA3IDA0OjA5
OjI4LDYyNCAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIFJFU1VMVFM6CjIwMjMtMDItMDcgMDQ6MDk6
MjgsNjI1IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gUkVTVUxUUyAtIHJ1c3QuUnVzdFNlbGZUZXN0
U3lzdGVtRW11bGF0ZWQudGVzdF9ydXN0OiBGQUlMRUQgKDI2NjYuOTdzKQoyMDIzLTAyLTA3IDA0
OjA5OjI4LDY4NiAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIFNVTU1BUlk6CjIwMjMtMDItMDcgMDQ6
MDk6MjgsNjg2IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gb2Utc2VsZnRlc3QgKCkgLSBSYW4gMSB0
ZXN0IGluIDI2NjkuMzczcwoyMDIzLTAyLTA3IDA0OjA5OjI4LDY4NiAtIG9lLXNlbGZ0ZXN0IC0g
SU5GTyAtIG9lLXNlbGZ0ZXN0IC0gRkFJTCAtIFJlcXVpcmVkIHRlc3RzIGZhaWxlZCAoc3VjY2Vz
c2VzPTAsIHNraXBwZWQ9MCwgZmFpbHVyZXM9MSwgZXJyb3JzPTApCg==

--_004_SJ1PR11MB6129BF5151577F93D523A6F4EBD99SJ1PR11MB6129namp_--

