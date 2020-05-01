Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.111])
 by mx.groups.io with SMTP id smtpd.web12.7669.1588331546752700402
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 04:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=H7tR4WBJ;
 spf=pass (domain: prevas.dk, ip: 40.107.8.111, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jt2e0Aj98Iu6uOQo+7p0kSqqay+imTidbZSmKwTzooN8Jal6bHaLpiUZ5O1k90P0vTQA0a/3aBf3aR8ToxB6Q675uwkN3PkGiwAjFAnLX9P5rlnHMxpZORb1Ztg9j+d1cMMVh9FSmaMlMMpcC7/lKG/Dw11cjrgsHx/v6D/a96Oso4pZZ4muFIpygU9g6FTroHDWpxCSV6wFwLxz7cIeH9x0LoXE5LTReGJyi/mBijGNdM7K8uIelcLdfsOEhKp0YncOlO0p/EFXDzVBTqrArGJw4LJNPny+pqsb7ChyaVERtf2SZF6eSVYzqxO9W0eBaZ6Xq79oTHz4pXtjsN9WAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKC9WuuyepcZzQvZQtE/FauVpFJrvutTNagZR5gVcyg=;
 b=ZZyzw1NBfg2qvuTsDcazz4yEYeLjiaFqt4Z0l1Ye/3caRBkygo3t4ffNOTfh/nM/frFmc7PqWuPf7U4CZpxDaGs2sIhNwUnnqvbnvu1edMvQoV6UFGK8kkT59zwHirWxphj9VtkHcsYi6SMHqtYFsYQ1wygxXjoo15AQu8hxWAqroao2/hVn54hEafDzRmimUhh9h/KI/yOHVfJR/mfwgtVg9iHvfKcjNCFmn1lKubbsYpB3y6WsLBjYyFgkGCCy907rkwoieorviYBWRrNtlsdiO0BxeWBV5c7sC7wvkbxFNZbHG+UmwztHytb/+BjCDD7rjVOje8W8RTZUh3O6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKC9WuuyepcZzQvZQtE/FauVpFJrvutTNagZR5gVcyg=;
 b=H7tR4WBJOHwmupijlY8GzUC3bEeo2v8IePKYFjDPJrlPS3x0R6b0GHpEx3ZQNp7b7J8RkpftM5qoDoufcdwlcQ/Orhu6N+6udbygwGyOlOJfRDx5EA7Dxcne3MxLS592xTkUqXtKRyQ102OVYZ6441LLy8ydL5whkow6NJqIpjY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21; Fri, 1 May
 2020 11:12:24 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.2958.020; Fri, 1 May 2020
 11:12:24 +0000
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Subject: Hard-linking to u-boot source files considered harmful
Message-ID: <048dae33-f047-7672-5ef4-9bf32f027568@prevas.dk>
Date: Fri, 1 May 2020 13:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-ClientProxiedBy: AM6PR01CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::48) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.116.45) by AM6PR01CA0071.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 11:12:23 +0000
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fa2f3e3-a878-4484-b3d6-08d7edc08668
X-MS-TrafficTypeDiagnostic: VI1PR10MB3535:
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB3535110DF36B48431CBC3B0C93AB0@VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZwB5IzuaX6y+2ZVrW2OLQDQ+kizun+aanbDpLa897EkO2D7tm6MVJRuxKrRvpHnJTgdn+X4VT8SFEStOFZVTW/CXbiCDsgZ5RmRFQXqWIQwCG8HWf9bFgbW7zobIoCsmawccJV8pBEE2NAtns9RM4h9JN9zAEhXFuvGgZJ/6yMKveC1XH7PL5g5q6WojvXcXB19UOzeZsC10I5Gul5cUl7FqUNv48+1+T93WCNhkKiEsf3uDBv67Y/D+XgWlteUiW2NzfF+XWdCabj9sM3GN594U9cETuK3ekVjoGPtx+puSB8vrbXsM/KDWoPUQj2jKrBeIYvhX05CaBARsxJTaxJsAnWfPYQskKBxiopbdbMzQbHtIdRBTdxMNQ//UZhY9Mb6BsmJAZVUtjBW2gOvLmax8E7ggg5uLrxsia8h4xCrmqfEWE9RIuNR0HR9Up2Pc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39840400004)(346002)(376002)(136003)(6486002)(52116002)(31686004)(8936002)(6916009)(86362001)(26005)(8976002)(5660300002)(8676002)(2616005)(956004)(36756003)(186003)(66476007)(66946007)(66556008)(2906002)(478600001)(316002)(44832011)(16576012)(16526019)(31696002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	V4cc60YFQpHYjqQfFuEyyz/US5aob6iS0VTkeh8x7peHz4o7FGiURDAU3rV1NVnwz48hFGLD8xhO3RJaVWZ+Gebb5W7JGyyIlfOd703B18mq/Abnf5v1NZFSEvc5J+d3nsVWT21eWeiLTbnyGr7SblcJXlo+32y2ZzqDCVR/pDxAQfpY6XpQ4CJUjeq6q97P+iIHA65TrZMC2cNETc2Lk2Sp3/MKsRtTS/nSK/g48XTwBRfw8stHCCEtYcORCUWHdz5C3maDQ/kjgER4mmes2e6MGErkfRiu8VCf/OZJKNyYWH5LVt8+wQUk4k6pReaDx1tXOgyrnmHxy/arHaC/iijex6tKgbI3kIgfi36NxgWzf80c5ob2Oc92BTE+NoKgikiBHX55uVtqsDMwnFV0DPbBbMi2aY9rZug6qYjje246C03FuWgF3ccXATwikJzDNEHyU79tKX8kfgp6YzAfVt8nY3LA+Vm4VmxWAefNZv752RO2o4QJAiTvXMO9yjjgng25tzAQzMX5ufZHGYo0Nw95qynbwDwfmrRKrh39OWaf16vJNvMXlAgJE25hTL49tP+SWHMgB/062dF5tWwjy09UMk1r8gWHaAmV7VUZ2ighzNHUsthZrmEzm1+/J0NI5/QHXD0linVQlOyXxE1sicoURi2Ht0UIsZRAshm7CNz4kUnKmsny/SY+ieHImb9B7ELRnAfv48A7lqeYr8WsePTiBMnYJClrHYezTem9SUXYU0oh8Sa10CrqvZk8+bFT3S4aEhsgP0cwT9/rlFHOHj1ul21TAX/PbXA1K/vi8hA=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa2f3e3-a878-4484-b3d6-08d7edc08668
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 11:12:24.2935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IF1h7OXuWWlfoJqsnz5WG1FcoOBFsPQ5gtqfHeN9V3dpBNp0PrwIHpxnK4srbdnZ35YAcr/3/pLTIAf5ES1PWXXMLcgXi1zolgI22W7fyGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3535
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I was wondering why my U-Boot build would always report as coming from a
-dirty directory. The /git source directory was completely clean and
matched the desired commit.

But the -dirty is appended by the scripts/setlocalversion (linux uses
the same script) if

  git diff-index --name-only HEAD

reports anything (mind you, you have to run that command before running
"git status" - the latter will update git's index so the diff-index may
no longer print anything). Indeed, that prints

  Licenses/gpl-2.0.txt

The reason diff-index thinks that might be changed is that, since the
git checkout, that file has had its nlinks (and consequently ctime)
modified:

  File: Licenses/gpl-2.0.txt
  Size: 18092           Blocks: 40         IO Block: 4096   regular file
Device: 811h/2065d      Inode: 41445215    Links: 3
Access: (0644/-rw-r--r--)  Uid: ( 1000/    ravi)   Gid: ( 1001/  abcdef)
Access: 2020-05-01 12:04:47.708081401 +0200
Modify: 2020-05-01 12:04:45.756078017 +0200
Change: 2020-05-01 12:04:48.032081963 +0200
 Birth: -

And who creates those extra links? do_populate_lic (and perhaps some
other task later yet). Since that is just "after patch before build", it
is almost certain to get run before the compile task gets around to
invoking setlocalversion and thus create the
include/config/uboot.release file. A crude hack that just forces
do_populate_lic after do_install indeed makes the -dirty go away. Or, an
even cruder hack, prepending a "git status" done in ${S} to do_compile
causes git to refresh its index.

I have tons of ways of working around this, but the question is, is the
optimization of using hard links really worth it? If it is, can we at
least have a "do not ever create hard links to stuff under ${S}"
per-recipe variable, defaulting to 1 if the "primary" SRC_URI (yeah,
that concept probably doesn't exist) is a git:// one?

do_populate_lic is not the only offender, btw., there's apparently also
some create-debug-package-with-sources that will do the same thing, but
I think that will by its nature always run after any configure/compile
step that uses git to create some version.

Rasmus
