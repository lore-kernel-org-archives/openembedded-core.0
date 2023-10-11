Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27AFCD98F5
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 04:50:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9887.1696999823627392406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 21:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K9iFKNQk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86485f6110=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B4oNvG020061;
	Tue, 10 Oct 2023 21:50:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=PPS06212021; bh=50n9xZT1q8JtF/glm7n
	7nbGFYFtqxZQ2x5YQNg6wJVw=; b=K9iFKNQkgsPxDNCaBVeRY7ZJB3+9yfzLx2p
	6n+AS1yg/MErMqN8QpIMoibFe74aZvIYC6P/wv/4MS04pgM/5uPPVbcZAHpP/s1/
	ZG58fZJYxDi10gEyA0hWJrGCZCXEs1+zSIIeUF/NLt2zejax/CMvLMRrkwJs7FhI
	HkCxy+DfONFeNMxFV9p1uXPURc4H2njgMazB+jnzhdKr1Z+Wk6vSQ/GxtbCtZnuV
	kdcxmfueGiZQd3cvxNZZESNAll/6dh9dvSxkW47odj6OetxvH53tjyGT7I09RHFv
	8HwH8Qh6uRJ0kc/sKP/f6Gd2Zgx3uh/ff4Iq/5q9U4hSklVim7Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq483v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 21:50:23 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39B4oMkN020056;
	Tue, 10 Oct 2023 21:50:22 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq483v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 21:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POtXv2aSd/OAuI6WuqjWW/n13081L99r1zE+bRe9gaPXq2dvRCd5gF7PxjjrgDqYfMQ09/Lj6N+cNmVt2vJo+g5jbKieLxMU7JpTrkHtm7SQ8XhFsspHLhFrEqLcrRwH9QXu1aGDNV7EHZy+G/oeDxUqS9f68+vgfUFCrP2lZ+RCK0FIsHbZBMsCvf4U7ABPCUvN/xbV90HB4wZIOvGbIyIGFnrCBjwgoZHJK8ueb77yx0FEK+nMBaoYlqsfYmKXnp/fnlR4sdplfsRTSC5zAQzrHTNWGmfrJlKWdwui3R00DwWFeJcQ3nVXDSfVgSgwGTwXLIA37eKkZvoSzc8Ggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50n9xZT1q8JtF/glm7n7nbGFYFtqxZQ2x5YQNg6wJVw=;
 b=GTZFG+dMYHusyMww7RfH919Iy+UlwNhJ3bSOvteRcJplf0xr4tH2lh+25YMfFcD04aR6Jgv67mTGnrzMsySeoqMZ/tl/JokuLTZ5t3o/zvlZ1+oNfaOIIHBX9IB2rNMsAcOqcrSB6QMXaTyF7rqW11fHTSwkthGXQNgOHGam2l8jpPzuReij1OIIgPePD+O8Aw4I+Mharus6LejAApJus1cJ29BMWwoNAAUfxh+Lp5sd08gG+GYhQfUCzUd1BUKuB4Q+dH89cqLGUwk3GFKYZZ4gtDKsvi9Qt3Ds0ugn1QONZeM8GqeQn0R9bXspd9JxbkB+Ul2dhuOyWOOUwQFBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Wed, 11 Oct
 2023 04:50:06 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::4550:92ba:e229:2549]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::4550:92ba:e229:2549%6]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 04:50:06 +0000
Date: Wed, 11 Oct 2023 00:49:58 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
        Paul Gortmaker <p_gortmaker@yahoo.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Mikko Rapeli <mikko.rapeli@linaro.org>,
        Randy MacLeod <randy.macleod@windriver.com>
Subject: Re: [OE-core] Summary of the remaining 6.5 kernel serial issue (and
 6.5 summary)
Message-ID: <ZSYpdnwTW+6FkBiF@windriver.com>
References: <178BF2895FF685E6.5378@lists.openembedded.org>
 <178C1443D3C8D91F.5378@lists.openembedded.org>
 <178C704E48D36FAB.24994@lists.openembedded.org>
 <178CD9772ED4DEB5.9719@lists.openembedded.org>
 <8943ba03ec46c2c6d115a4fcdb8412571f56543d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8943ba03ec46c2c6d115a4fcdb8412571f56543d.camel@linuxfoundation.org>
X-ClientProxiedBy: YT4P288CA0015.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::15) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|BL3PR11MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5ac923-3dc0-4d9e-0fad-08dbca1589d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9V0dJoGA/8knKkMIY8uKCQYUPqhmBEoRSjYAj8VmAr06v23fJESVU3MP5Z7sJouNSxF3ciAkEDpeMCsKTH5kmZ/BO2Opl9UO89PcjJRXbAnnc0hGLxoss5ifNPR2KsH73rE6FBjNnvg5tO+e5+pr/TQcmcoE+udSSHEhymnQV3tmmCrVRgqHTvxJ0GlYrYwV58Pxqij2mtbP3/shJG2TO2jl05MCSj7AJAmnZamMDiSHyinjPVjX5+gr1G+hPx/F/jQqVHbq5GXTKyaIDpXdFAdx6z2ylQ7LR3DVniIF+KPehd6vtrkpESJGahP8xPz8Qv0aLG3bvh+Gl3JWCti33rQLAGnIO/lbQ2HvmbpPJJEU4N4x7sblfofXABbrn5PLtNNqgH+0eY/sAsizoEAFzjukJrNv6sNM5fAVwAiIZceSF1Vz0+EUz5dbNXSwwsBKvfMUPxK8rxcgCCN6+TIVJbQki2QQY3qmF163CMaboZIMgPCwKmheRfBq/Z8xCPAHQRqqxHNl1E/SatrnfB1f+bBUnt3cR+HZA97BfvkBkMOVx/2SW1kw1OjCupvmaS4avYcgVYeDTFUaf8gKK1irtMV2dlMCCKWZlm11/K2Lqhs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(39830400003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(107886003)(6512007)(86362001)(36756003)(2616005)(38100700002)(4326008)(66476007)(2906002)(4001150100001)(83380400001)(8936002)(6506007)(6666004)(966005)(478600001)(26005)(6486002)(6916009)(44832011)(316002)(41300700001)(8676002)(54906003)(66556008)(66946007)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rHCmlyeAb34GSt+AQTUoxp4OAGkGD98lExYv1sw2YFr+meIMY7ZILbkC/6BZ?=
 =?us-ascii?Q?w81G6zRyTixAPoE2EP2/cGrKRj/wRbH0HrDcIQ9KSYnwggqnPIoH529Cm1+c?=
 =?us-ascii?Q?ZB6fS6OLSlGy83p9LcEqSjxMjakIob6HzArE+Sh1cSyfs7LgPJtkFgxCD7Gj?=
 =?us-ascii?Q?MTS+CM6ZYJ4dkHlvPONfh2aHotyNruO7j9ne5hKoTd+uG4wx/YKEslAz9pnN?=
 =?us-ascii?Q?9Z5vWY8MoOhkogUNkWw/JnXPY555NY+M80ZcAFh8NGCIAvf9dR+wY1bg13Ge?=
 =?us-ascii?Q?ooD+BDiH/4mTohddHwnNcPGgbyoCddqbFZBQNTUW1h7FI9/dvHDzyJYK6yEu?=
 =?us-ascii?Q?jWVBbl8UgW3qb5THuSwp419zHXkGkQCUrO43iSy+n6kFeooGICI2qsmWZZL+?=
 =?us-ascii?Q?w3nftxC9a0uJK+Q5WefltaoJK+FpJQr47EVNTbZAYCVWs0RQrP/UjlSi6Fz2?=
 =?us-ascii?Q?TzwdXiisMIP54WkeinmKta+luttExF+Dqgj2qKvtCqsLBpBi+MAhAVkQrJgS?=
 =?us-ascii?Q?jj4UBJFDc2T4PIdL2sgguB93AVU79SAGZ5xulOsXL6P4yJ8py9YmtKu1Kcz5?=
 =?us-ascii?Q?2U6CZozRk27IJhIX+9QA+s40AUt+D2Vvby6V9DHjM0e3xFfjoz1OhH8LTjQs?=
 =?us-ascii?Q?2oxH4o3MSBRmXwYammFu+2Acn2WUCUFL7Ssea5pVp+30EvGE3cpZTzNbv87P?=
 =?us-ascii?Q?2J4LeFJ7f6nRQuvHfSaZW02kC3kfTUAz28ea5c9COfY9i04MoC38wUjVC74m?=
 =?us-ascii?Q?jsdSd9sHptPMxixbKSl9cbAlN/i6BNQlhct3smqTzwIGFsZ7HFDapWpxzb+v?=
 =?us-ascii?Q?/KLpMU42QE8dsRThrgWD/PEJsiL5K2qA0fSMd5F9S9B8KYuCc+HZ/egV035q?=
 =?us-ascii?Q?+PXMt0i5QiI/X4dPXl6O0m5EqTSj4Oy1URugwlEpJD/ulDcw9CFQHEZ1KCN6?=
 =?us-ascii?Q?g5iXfCgUUhiqVbqjaQGJzBQCeZ0fFlrzz8PNr7ryfMc1y5kGLe3eAwLqqqaE?=
 =?us-ascii?Q?ygN9Rj8n5A9FAx8RG1pMDj8/yGuY320ogk4MVud2EqEqwk7cJzDVb9hQT7ux?=
 =?us-ascii?Q?0uNI5vBPy6qcW6ZyiFTn3A+IwLvwjrBPws92c93ojNjFWaimyBZRtwQW9Pqo?=
 =?us-ascii?Q?IxV4atfSNnOnRY9NOdh5m40Wr9g32IZHmqZebcCjjm030m4Amg+4ydbdB15q?=
 =?us-ascii?Q?TR/hK83tJpaagEVyl8xbKmCcJyQijkuWQ/tHrbL05qlkdAptxQrJzR1aJbLR?=
 =?us-ascii?Q?KHJpCpfIhyXhxUF2C0Zzkk8Zd0rXh5Gb033V+T90QQPk3UJJiMSOoxdvzKR5?=
 =?us-ascii?Q?FF0++ZZmWCm4OCv0VZqIzdT6ouvnMPzL308XegxGVa+E23QnuqChCKn0gXZ1?=
 =?us-ascii?Q?NP5FIO2K8xqYFY/2UwOl1yLJ20dVolNQ3lboWOjPoKhfhO/AV00oKOUb2Z59?=
 =?us-ascii?Q?h54CBCMjm0sHDGR/4AELLP/Qgb5E3bPn9CtgUqjPZ8HkwBsh3zDMKC3vjLqO?=
 =?us-ascii?Q?6CbkY/gfEE92ARQKrylRQoCykzIRgZ/ZhIjCgHV2VdZrZArLUzW/XtN6itRY?=
 =?us-ascii?Q?+JMOabLV/bocnLmWeqPOnsEG/ZhKQ+M/RUWYXyUEt3R77YVxpnFcSYj375y6?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5ac923-3dc0-4d9e-0fad-08dbca1589d5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 04:50:05.9970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CON8ry2llRGrZm28RKTHZCyliroxGoJd9naU/XM7SH8hlEor2V311ssuK/ECapMXlyFT8sBI2ISZuFUDp0UKXbFQwOO1WCH4INlNIRUBV2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
X-Proofpoint-ORIG-GUID: q8rOnNB7RrBtDs_B1gdl4g7u2P0xN2Qf
X-Proofpoint-GUID: qCFUyykf38svYR72thy3mT8CXPiRtjVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_01,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1011 mlxlogscore=999 phishscore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310110043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 04:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188941

[Re: [OE-core] Summary of the remaining 6.5 kernel serial issue (and 6.5 summary)] On 10/10/2023 (Tue 21:53) Richard Purdie via lists.openembedded.org wrote:

> On Tue, 2023-10-10 at 21:37 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > I've been asked how to reproduce this setup more easily outside of
> > OEQA. I hacked this up:
> > 
> > https://www.rpsys.net/wp/rp/simpleqemu.tgz
> > 
> > extract it, hack the paths in commands.py to point at a qemux86-64
> > build of core-image-minimal and then "./commands" should boot an qemu
> > image using the system's qemu binary as it would during the QA tests,
> > setting up the two serial ports as it would during tests.
> > 
> > Obviously I've just brutally hacked this out of the QA code so there
> > are plenty of sharp edges. It should allow the serial setup to be
> > replicated and experimented with more easily though without bitbake
> > involved. It could be cut down a lot more too.
> 
> and set runqemuparams = 'nographic' in commands.py if you can't cope
> with graphics :).

So I think we are onto something here.  Let me rewind a bit to provide
a bit of context for those who didn't follow the IRC discussion.

The OE/QA is running qemu with the "-serial tcp:<IP>:<port>" option and
binds to that directly through python.  In theory, one should also be
able to use netcat/socat (or even telnet) to bind to the qemu TCP via
manual command line testing without the autobuilder/OEQA python.

But I couldn't get that to work without getting "broken" echo behaviour
and similar tty/terminal odd characters displayed.  As that was also
observed on v6.1 and mickledore, I didn't want to go off on a wild goose
chase after something that probably has nothing to do with the issue at
hand here.

Hence leading to what Richard created above.  The basic premise is that
similar to the AB output, we are looking for log files ending in ".2"
that are from ttyS1 -- that are smaller than normal - indicating that a
getty wasn't able to get the login banner out successfully.  Now the results.

After 300 runs on mickledore with v6.1, all the .2 files were the same
size - 477 bytes.

After 155 runs on today's master with v6.5 kernel, I got two runs where
instead of 477 bytes, they were 345 bytes.

dot-two$ls -l1|wc -l
155
dot-two$ls -l1| grep -v 477
total 616
-rw-r--r-- 1 pgortmak users 345 Oct 10 17:54 qemu_boot_log.20231010175351.2
-rw-r--r-- 1 pgortmak users 345 Oct 10 18:43 qemu_boot_log.20231010184307.2

The difference?  The "short" files ended with "Starting crond: OK" and
were missing the login banner:
   --------
   Poky (Yocto Project Reference Distro) 4.2+snapshot-0fb1ff0ffb527a6364cef7159c0d9dcb879e8dd9 qemux86-64 ttyS1

   qemux86-64 login:
   --------

Similarly, for the ttyS0 logs, if we strip off the printk.time prefixes
thus allowing us to diff the corresponding "outlier" case against any
one of the 153 "normal" cases, we see that this line is missing:

Last login: Tue Oct 10 22:40:31 +0000 2023 on /dev/ttyS1.

...which makes sense, since the login never appeared on ttyS1 for OEQA
to interact with and login to.

(interesting that otherwise, ttyS1 always "wins" the race to update
wtmp/utmp over ttyS0)

Anyway, that works out to approximately a reproduce factor of a dismal
1.5% by my math.  Ugh.  But at least it isn't coupled to a full build!

Finally, using an identical build on master but with PREF VERSION of
v6.4 kernel, I ran 300+ instances and got zero instances of short .2
ttyS1 log files that were missing the getty output.

Note that these runs were using the default qemu v4.x that ships with
ubuntu-20.04 ; I've not (yet?) run similar tests with our own more
up-to-date qemu build from the sysroot.  Maybe I don't need to?

Possible conclusions:

The reproducibility seems pretty low, which seems to match what I've
heard with respect to the AB results.  It also seems confined to the
v6.5.x kernel, based on these limited results - matching the AB results.

So maybe we have a reproducer that is independent of OEQA and the
backing of a full build to get there?  I'd like to think so, but I'm
going to run more v6.5+master tests overnight to try and get better
stats - a +/- of just 1 changes my current reproduce # by a large
percentage!


Next steps:

Each run takes approximately 20s, and with a 1.5% success factor, a
minimum of 150 clean runs is needed before one can say "OK, *maybe* this
kernel currently under test is OK.  That translates to over an hour to
get a data point you have some faith in as being "good".  [Still a heck
of a lot better than doing 150 *builds* though!]

On the other hand, just one instance of missing login on ttyS1 is
concretely "bad" and hence the test run can be stopped as soon as one
instance of that is seen.

This "good is really maybe perhaps good, but bad is for sure bad" type
of bisects that I love to hate.

Since the data points are "expensive", I probably won't just attempt a
mindless brute force bisect.  I'd probably do something more like...

--ensure modules (or lack of) don't impact the results, so I don't have
  to rebundle rootfs images.

--maybe see if I can build with host gcc vs. using devshell/sysroot gcc
  and still see the issue.  Although really, kernel build time optimization
  won't be the bottleneck in this particular case, so not worthwhile?

--check vanilla v6.5 (i.e. v6.5.0 -- no linux-stable content) so I know
  whether to dig around in v6.5.0 --> v6.5.5, or dig around in the
  much much larger v6.4 --> v6.5 additions.  I expect it to be the
  latter, i.e. digging through mainline, but who knows.

--assuming mainline introduced it, instead of a brute force bisect, I'd
  look for merges by Linus from gregKH pull requests for the tty and
  serial subsystems in the merge window (v6.4 ---> v6.5-rc1) and test
  both sides of that/those merge(s).

--if things haven't completely fallen apart by that point, I'd be left
  with a relatively small set of subsystem specific commits from a single
  pull request which then could be bisected.

Sometimes in the past, when I've got down to that small set of commits,
the culprit almost jumps out at you when scanning over the shortlogs.

Anyway, that is where my thoughts are at.  But of course we don't even
yet know if this "test" is even accurately reflecting the OEQA/AB issue!
So nobody should get their hopes up too early.

As a side note, and something that kind of was briefly discussed on IRC,
it seems to make sense to someday informally "support" the idea of
developers being able to use a chunk of the OEQA like this in a
stand-alone mode - since we always seem to be chasing issues that only
show up in AB output - with people struggling to reproduce elsewhere.

Paul.
--

