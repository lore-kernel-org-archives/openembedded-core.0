Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51254C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 09:39:08 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.47])
 by mx.groups.io with SMTP id smtpd.web10.9827.1693215543696719918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 02:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=iOXIdicX;
 spf=pass (domain: welotec.com, ip: 40.107.247.47, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVey6BLYqvnMvOdWzFKwbQ5KAE5/w64OFe3wa+ixZrPQVD33mEHoN5Clsn5ChMtgNtLamIs4dTZ1OJBDykCqrmM2PvWWVPWNBPfCuYOgn1K643/pdR0/gMauEBJzakSTSzm0pn9W8oPaA5uLpyojxZiziTgsnpfw+qKpowrIQDSF+6no3dqQLtuD73IyHMYsdS3q4RuJjGr9Ei9nYH3q1mh0x8w4c0woT3AnPu6RepO8att39u44DJzxV6zQz2l4NetK5ri0td5UX+I6CnZfqIQA1umtO+6jkp+tWhjcwwL56v60GN/bFerEc+rkbjpipOVv2mVaQqnWNxuUzHD9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oesrpMboBHbmMJKV3DNgHHcCkwkVu+Q+sT9j3UbCoBs=;
 b=B7GF0YFW5kgUXzvlItibKh+Ca2l3610sEAjMEtlAxPrTpXJujITMsnAqSG+mhFdZt7sETBoZ2MQgq+LZ3Mn9iH0ke5lKISopwRZ8azDECsoCApXOhwLWRWrmKu47JW+7FEU+LGZIYAmvBqhyAHe7NBHOYW7sxP1A8HP6hF0TkE3xkBIFAnayIBkHDfrxjo07+2GGcIfDMIalkcUX4LlxrtZ4LmC9OAvhYRVcN2y1ljOBVOXnx+liH9DuDBKGseoswwvZ4jO3dSQiX2Axg+J3HrAdShx+0Se1YNV87T2WTDlubj1KUHmYk1gzODtSrqpj0CATEYc8A0HCqTgKDXKKBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oesrpMboBHbmMJKV3DNgHHcCkwkVu+Q+sT9j3UbCoBs=;
 b=iOXIdicXNMR7abjWQll/+Xvdwy9bCkI3/UOYE1j3mAHH+Zysaj5jMU/N6r3LQuWHTDk0bYO3hA89pISSirX+YE2MqZw6fJ9GcSVh3nR8QAUnvep/b2sERagqujpifITKJDV/vIgIqiF/tKyl0UwlWH1DMYmbPq/g87EKEis0ictf/hMvj3a62PHmu/+UUlMzUbnHcU9CaTRK5eEu+5A2ZIom5ZcNBSB1qMEiWJylPi+EHteEMgFbv8b9gaCdG4CSlF6ent11zwFQVR7xWPxUi90VIaTcq7kA6WUQllHqMsuV0FrePCRszxAPwDjZNGhIHnOdiwJuuNMMEXz5puGJ2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB8203.eurprd04.prod.outlook.com (2603:10a6:10:242::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 09:38:56 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::8fc1:4de7:8494:591b]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::8fc1:4de7:8494:591b%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 09:38:55 +0000
Content-Type: multipart/alternative;
 boundary="------------22ifhH0VXpUptkwIn0nyt0Lw"
Message-ID: <531562ae-beac-e96e-176d-4e72a0a6a2ce@welotec.com>
Date: Mon, 28 Aug 2023 11:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-Core][PATCH v12 4/7] sstate.bbclass: add support for ACLs and
 xattr
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230804084315.55768-1-p.lobacz@welotec.com>
 <20230804084315.55768-4-p.lobacz@welotec.com>
 <38b47e0e41d508adc514058475474befbbf53445.camel@linuxfoundation.org>
 <177F7F952788FCE3.29523@lists.openembedded.org>
From: =?UTF-8?Q?Piotr_=c5=81obacz?= <p.lobacz@welotec.com>
In-Reply-To: <177F7F952788FCE3.29523@lists.openembedded.org>
X-ClientProxiedBy: BE1P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 2afc39f0-3440-4263-e2a3-08dba7aa98da
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uk/JI7GiAgGrpPv64aokQGxgcP3xlZndlSuJ0kcEuZfNBsiJKi9fHP/TNiu9Yqt905sfDbwF0bm9vvioAj+Ofumed4/uay7enAsqXsDAbQtvTGnU8KmZwIrC9XU0V3o5VYd/pfkIQP03C3hG0l1IuOKrHXSrVOv8iMgWH2K/TJHt0Lc1AjSgjSaTQQ6qS1CvMOlJGn3Wu1oVdgngAiSdV4BHEEF0NM4sqbY5+vScHAEYpcWWCqntvdnfLRYmtqX/YtErnHU3D/rdexshJU28LaepKxXIdAJgqPEcHwNKzMK1dItdJ2SesW4jTyGOhi8uIPovmUtJ3tJDxqJ236aPi8Bks10gp0jxPpd8Id2gAB+nD2kwlqaDdCZfbRlGhP/jZPlasiCNx7XQll5lArbQuNQD9JmA9xOOp+la9wT5L3fDOw80mYDIBmnicpxy9wdoO6pK3CABR1F73roLVxv+Bw5Mr5Lo6+kt6B9G6Pt3tfCFabLDsrnDtnK+EAy38gafia3hDeqEv9Xih1ZJ5WtKwm61llwKhVIZkaSQtJdSJ8FJRvqMR9XkabQFZdYegEIqY/s4fnrsYNLkIECYje5MpIYCRpZh/a0Y7+obLxPKuTuqP3o/912Z0vju8igdUtnSlqglH9RJtz6hB561E3vhS2iUljj/EAUdHUfiG7YBoS0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39830400003)(376002)(136003)(396003)(346002)(186009)(1800799009)(451199024)(66899024)(6512007)(166002)(6506007)(33964004)(2616005)(6486002)(31696002)(5660300002)(86362001)(30864003)(2906002)(41300700001)(36756003)(8676002)(66556008)(66476007)(8936002)(38100700002)(110136005)(45080400002)(316002)(66946007)(478600001)(966005)(83380400001)(19627405001)(66574015)(31686004)(26005)(2004002)(45980500001)(43740500002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L1pWRlNHQitkdVpwZ0hIMW00K2hnenBwdkNadmxCSVFhN3R4cFVwWDB0ZmxS?=
 =?utf-8?B?RW8rZGRoSExMMTlnUFdQL1oyRWZrVHFwRHhpZGlTSS9udjFnbEMvYnRmUStr?=
 =?utf-8?B?VVF0eDg3U0pJV0NDTHlWTkdOOVNtSmJSblpRa1V0RkV3MWxpSnJmY3Z3enNK?=
 =?utf-8?B?cUI2QSttV3prempFeUZzOVhoTk0yZjhHby9EdHRJV051NkxrZTFidVFrOVJR?=
 =?utf-8?B?QlV3VTRldncvRGYyOTF2dXRuSEFUN2ZHYTRhUHBEK3pkcFdMdkM2ODUzN0hX?=
 =?utf-8?B?WWJKMFVwMzBrNnl3eGl2ZlNwQjdPQ2hFZDBtMmdXZGRBVlJCMk9pM3pORUpP?=
 =?utf-8?B?YndrZ25LYmhlVGxHREhNaXVkOGVibkNMYUpDU05xTk1DVXU3Q0l3cjlYMGJu?=
 =?utf-8?B?UUgrL0ZMYVlnWGo5WUd3VDFLNm5lTjMwZjVHajRNdW9WVFVJejBFaG9jdHNS?=
 =?utf-8?B?cXhvb0hrL0pUaUN6Zk1KUTRqMW8wOHBQdDN5b0pOKzNSb3llN1VnQ2xXV1Vl?=
 =?utf-8?B?RHRETUpSa3lNdThkNFV1cTNIZDFsR21LTjhHNk1lTGFybXFCK3Z5TEZrekY1?=
 =?utf-8?B?bXFTR21BclI2QVJNT1VuTjlraXAyLzhKeVRmL1pRWU1SZzVzU1JoODBvVFd5?=
 =?utf-8?B?SHg4MWljTHFUeDlqRklWdnIrdnMyZG5JTmdVNkVNeGlVQW9qWFp2Y2Rpbk03?=
 =?utf-8?B?Wm0veTMrY2c5a29nRFZ6blhWZ2Vid1ZPb2t5RlNUM0J0SHJueHZEOUtNOWZR?=
 =?utf-8?B?cDlTdEQ2bldtZmRVTm92enJKbkN5WHdFMXY3OVFmMTdyS05kM3dSbWlmMEhw?=
 =?utf-8?B?ZHJVbVJSU25CaUY5a0FaNFQxZms4MXNEMkhUellDM0ZFeGFwVkdPT1Y4N2dr?=
 =?utf-8?B?ZFZKNTFQUlRhZ0IwOFUxeVJwMENIRzdHekNSMGpOb3RyYlZiMHdoaENpZ1hT?=
 =?utf-8?B?M2h6WitNR09tQTZnaEZ0TnZHOU9zYytqTWkwTGgvSVd6ZlU5RGF3OW1IZlI5?=
 =?utf-8?B?aDlQTlljd1ZKbUdKendncm9rRWszTEZySGMvNTFaaG9zS2U3NTFiWjNHMmdl?=
 =?utf-8?B?c21iOFIzb1dMZ1hHRHhmRUpEclp3STVZbXhmR3VXcEYycnA1TVVMampERDBi?=
 =?utf-8?B?SGJNK0pmZlNBYnRZcDFOK2NXaTJMOG8rc256Mmpsb0x4aCtDcXlRRmRTTllX?=
 =?utf-8?B?VGRrYkJzYm1tNG03OVlVWURMcTluOFhmU291T2J5dTdxcjd0ZHJDeHU4Z3hF?=
 =?utf-8?B?ZkhRRk1nN21rVG1GM3hjakFvZHhoK3ZmTDZCZHR0a1J2NE90ZlgwaXBHQzhQ?=
 =?utf-8?B?bXVKTHBneUdjV3pvd2xkaDNqNXBwWEFBWndMVS9oc0Nxd3drUDU5d1RBMGJO?=
 =?utf-8?B?eStkV096VGZzcUJUOG5MUUJPbDdyWTU2QkNCMUpTRWlXRDFQaEQzamNXQWpS?=
 =?utf-8?B?UCtGQ1l4Q0U4N2owU09qRlZRczUyS0Q3YjV6dEtraHpINjF6UUNiSEVUQXk3?=
 =?utf-8?B?UzdONXNGKy9oWktIZ1kzVUV0dDNHWFI2bDcxZTFyVnc3S29sek1DR1VaRlpr?=
 =?utf-8?B?RjVFdjhPNjJLY295bzV4S0N3U0M0V0w1b3U3Q01lK25Eb3lwOWs4cWRwZmsw?=
 =?utf-8?B?Q01yU1MrZzkvVVRCU1dmM05WNWU0MXFBaWtwcnMrbEYzQWJ2bWJNb1RSNG9B?=
 =?utf-8?B?dWEyOC9KYWI4elB3R09jOC9TYUJLMlpVQ3hJQ2RSaXlTQVE0aWZ6d01iS1gr?=
 =?utf-8?B?WGtqT09wNzlVek1NNlhkSDN0b212MlhuUm1SMXp4QjE0NEMxSll6b2g3WWpx?=
 =?utf-8?B?N0o1RWZTL3pmYWpCWVA1c09JampGbU5KVmZJMG5VdWxUaTR3Z3BWM0ozSHJ2?=
 =?utf-8?B?bm41OWlnVE81Ti9GMDFUNXlqVnZGWnFGZFo4bTZkMDFzZFBvc2hsSXcxWFph?=
 =?utf-8?B?b2orV2Jta3N2UHlDaUxXUEJ6L1phM3ozZzdNU2tEcDl4Z3R3T2Q1SSswRys0?=
 =?utf-8?B?NzY3c20zTitSNUI2YjYrelpYZUdXMklXSGZKTWF1OE9XTkI5MTRLYlc4bWdI?=
 =?utf-8?B?QVlMRzBUVWMrNENjVzloc0VpZ3REUmpYTndRT1lwcGJpY2FMNWdXOWlyRzdY?=
 =?utf-8?Q?SzE7fGkb044xXyvyOPzXN13TK?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afc39f0-3440-4263-e2a3-08dba7aa98da
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 09:38:55.9085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adu+Lc2mlZK2T1xKjLvaCTqGkNUYzrXFvYvrBJvArPnZk/FdfGX/T6gDmmDGZcOE2ohVSNZdDa8cNV9uQbMG6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 09:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186820

--------------22ifhH0VXpUptkwIn0nyt0Lw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

OK Richard, according to this link 
https://github.com/praiskup/tar/pull/2 they have fixed it in 1.35 release...


W dniu 28.08.2023 o 10:44, Piotr Łobacz via lists.openembedded.org pisze:
> Hi Richard,
> I have discovered in here https://savannah.gnu.org/bugs/?59184 
> <https://savannah.gnu.org/bugs/?59184> 
> that this is a bug in tar, which is already reported. The solution, 
> which is given out there is ugly, but on the other hand solution which 
> will be added to tar will cause also to update machines so we need 
> probably to discuss the best option for us...
>
> BR
> Piotr
> ------------------------------------------------------------------------
> *Od:* Richard Purdie <richard.purdie@linuxfoundation.org>
> *Wysłane:* czwartek, 24 sierpnia 2023 09:08
> *Do:* Piotr Łobacz <p.lobacz@welotec.com>; 
> openembedded-core@lists.openembedded.org 
> <openembedded-core@lists.openembedded.org>
> *Temat:* Re: [OE-Core][PATCH v12 4/7] sstate.bbclass: add support for 
> ACLs and xattr
> On Fri, 2023-08-04 at 10:43 +0200, Piotr Łobacz wrote:
> Extend `tar` command, with additional parameters, depending
> on choosen package class and target distro features, in order
> to support ACLs and xattr.
>
> Additionaly set archive posix format, in order to preserve
> milliseconds in timestamps for reproducibility tests.
>
> Currently only `package_ipk` supports fully ACLs and xattr.
>
> Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/sstate.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/sstate.bbclass 
> b/meta/classes-global/sstate.bbclass
> index 95373fd60a..ac890fc98e 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -848,7 +848,7 @@ sstate_create_package () {
>          mkdir --mode=0775 -p `dirname ${SSTATE_PKG}`
>          TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
>
> -       OPT="-cS"
> +       OPT="--format=posix ${@bb.utils.contains('DISTRO_FEATURES', 
> 'acl', '--acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 
> 'xattr', '--xattrs', '', d)} --numeric-owner -cS"
>          ZSTD="zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
>          # Use pzstd if available
>          if [ -x "$(command -v pzstd)" ]; then
> @@ -914,7 +914,7 @@ sstate_unpack_package () {
>                  ZSTD="pzstd -p ${ZSTD_THREADS}"
>          fi
>
> -       tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
> +       tar -I "$ZSTD" --format=posix 
> ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)} 
> ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', '', d)} 
> -xvpf ${SSTATE_PKG}
>          # update .siginfo atime on local/NFS mirror if it is a 
> symbolic link
>          [ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e 
> ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null 
> || true
>          # update each symbolic link instead of any referenced file
>
> I've been putting this through a bit more testing and sadly we're 
> still not quite there. In testing last night we saw a lot of failures 
> like this:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/7488 
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/7488>
>
> i.e.:
>
> WARNING: cdrtools-native-3.01-r0 do_populate_sysroot_setscene: 
> ExecutionError('/home/pokybuild/yocto-worker/wic/build/build/tmp/work/x86_64-linux/cdrtools-native/3.01/temp/run.sstate_unpack_package.1434763', 
> 2, None, None)
> WARNING: Logfile for failed setscene task is 
> /home/pokybuild/yocto-worker/wic/build/build/tmp/work/x86_64-linux/cdrtools-native/3.01/temp/log.do_populate_sysroot_setscene.1434763
> WARNING: Setscene task 
> (/home/pokybuild/yocto-worker/wic/build/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb:do_populate_sysroot_setscene) 
> failed with exit code '1' - real task will be run instead
>
> The sstate in question is this file:
>
> http://sstate.yoctoproject.org/all/universal/aa/63/sstate:cdrtools-native:x86_64-linux:3.01:r0:x86_64:11:aa6350f6565599ed04df25250bb5415c0e2427b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst 
> <http://sstate.yoctoproject.org/all/universal/aa/63/sstate:cdrtools-native:x86_64-linux:3.01:r0:x86_64:11:aa6350f6565599ed04df25250bb5415c0e2427b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst>
>
> and the failing task log:
>
> pokybuild@debian11-ty-1:~/yocto-worker/wic/build/build/tmp/work/x86_64-linux/cdrtools-native/3.01/temp$ 
> cat log.do_populate_sysroot_setscene
> DEBUG: Executing python function do_populate_sysroot_setscene
> DEBUG: Executing shell function sstate_unpack_package
> recipe-sysroot-native/
> recipe-sysroot-native/sysroot-providers/
> recipe-sysroot-native/sysroot-providers/cdrtools-native
> recipe-sysroot-native/usr/
> recipe-sysroot-native/usr/bin/
> recipe-sysroot-native/usr/bin/cdda2ogg
> recipe-sysroot-native/usr/bin/cdda2wav
> recipe-sysroot-native/usr/bin/mkhybrid
> recipe-sysroot-native/usr/bin/devdump
> recipe-sysroot-native/usr/bin/isodebug
> recipe-sysroot-native/usr/bin/scgskeleton
> recipe-sysroot-native/usr/bin/btcflash
> recipe-sysroot-native/usr/bin/cdrecord
> recipe-sysroot-native/usr/bin/readcd
> recipe-sysroot-native/usr/bin/isoinfo
> recipe-sysroot-native/usr/bin/isodump
> recipe-sysroot-native/usr/bin/cdda2mp3
> recipe-sysroot-native/usr/bin/scgcheck
> recipe-sysroot-native/usr/bin/mkisofs
> recipe-sysroot-native/usr/bin/isovfy
> recipe-sysroot-native/usr/sbin/
> recipe-sysroot-native/usr/sbin/rscsi
> recipe-sysroot-native/usr/share/
> recipe-sysroot-native/usr/lib/
> recipe-sysroot-native/usr/lib/libfind.a
> recipe-sysroot-native/usr/lib/libschily.a
> recipe-sysroot-native/usr/lib/libedc_ecc_dec.a
> recipe-sysroot-native/usr/lib/libhfs.a
> recipe-sysroot-native/usr/lib/libcdrdeflt.a
> recipe-sysroot-native/usr/lib/libscg.a
> recipe-sysroot-native/usr/lib/libfile.a
> recipe-sysroot-native/usr/lib/siconv/
> recipe-sysroot-native/usr/lib/siconv/cp10006
> recipe-sysroot-native/usr/lib/siconv/iso8859-16
> recipe-sysroot-native/usr/lib/siconv/iso8859-9
> recipe-sysroot-native/usr/lib/siconv/cp10007
> recipe-sysroot-native/usr/lib/siconv/cp10029
> recipe-sysroot-native/usr/lib/siconv/iso8859-6
> recipe-sysroot-native/usr/lib/siconv/iso8859-4
> recipe-sysroot-native/usr/lib/siconv/cp1257
> recipe-sysroot-native/usr/lib/siconv/iso8859-13
> tar: recipe-sysroot-native/usr/lib/libfind.a: Cannot open: Permission 
> denied
> tar: recipe-sysroot-native/usr/lib/libschily.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/libedc_ecc_dec.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/libhfs.a: Cannot open: Permission 
> denied
> tar: recipe-sysroot-native/usr/lib/libcdrdeflt.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/libscg.a: Cannot open: Permission 
> denied
> tar: recipe-sysroot-native/usr/lib/libfile.a: Cannot open: Permission 
> denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp10006: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-16: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-9: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp10007: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp10029: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-6: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-4: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp1257: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-13: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-2
> recipe-sysroot-native/usr/lib/siconv/cp437
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-2: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp437: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp775
> recipe-sysroot-native/usr/lib/siconv/iso8859-15
> tar: recipe-sysroot-native/usr/lib/siconv/cp775: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-15: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp857
> tar: recipe-sysroot-native/usr/lib/siconv/cp857: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp1258
> recipe-sysroot-native/usr/lib/siconv/cp855
> tar: recipe-sysroot-native/usr/lib/siconv/cp1258: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp855: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp864
> tar: recipe-sysroot-native/usr/lib/siconv/cp864: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-5
> recipe-sysroot-native/usr/lib/siconv/cp1254
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-5: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp1254: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-1
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-1: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp861
> tar: recipe-sysroot-native/usr/lib/siconv/cp861: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/koi8-u
> recipe-sysroot-native/usr/lib/siconv/cp10081
> tar: recipe-sysroot-native/usr/lib/siconv/koi8-u: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp10081: Cannot 
> openrecipe-sysroot-native/usr/lib/siconv/iso8859-14
> : Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-14: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp852
> tar: recipe-sysroot-native/usr/lib/siconv/cp852: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp1250
> recipe-sysroot-native/usr/lib/siconv/cp10000
> tar: recipe-sysroot-native/usr/lib/siconv/cp1250: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp737
> recipe-sysroot-native/usr/lib/siconv/iso8859-11
> recipe-sysroot-native/usr/lib/siconv/cp866
> recipe-sysroot-native/usr/lib/siconv/cp860
> recipe-sysroot-native/usr/lib/siconv/iso8859-7
> recipe-sysroot-native/usr/lib/siconv/iso8859-8
> recipe-sysroot-native/usr/lib/siconv/cp869
> recipe-sysroot-native/usr/lib/siconv/iso8859-10
> recipe-sysroot-native/usr/lib/siconv/cp1252
> recipe-sysroot-native/usr/lib/siconv/cp850
> recipe-sysroot-native/usr/lib/siconv/cp863
> recipe-sysroot-native/usr/lib/siconv/cp865
> recipe-sysroot-native/usr/lib/siconv/cp1255
> recipe-sysroot-native/usr/lib/siconv/cp1256
> recipe-sysroot-native/usr/lib/siconv/koi8-r
> recipe-sysroot-native/usr/lib/siconv/cp1253
> recipe-sysroot-native/usr/lib/siconv/cp862
> recipe-sysroot-native/usr/lib/siconv/cp10079
> recipe-sysroot-native/usr/lib/siconv/cp874
> recipe-sysroot-native/usr/lib/siconv/cp1251
> recipe-sysroot-native/usr/lib/siconv/iso8859-3
> recipe-sysroot-native/usr/lib/libparanoia.a
> recipe-sysroot-native/usr/lib/libdeflt.a
> recipe-sysroot-native/usr/lib/profiled/
> recipe-sysroot-native/usr/lib/profiled/libfind.a
> recipe-sysroot-native/usr/lib/profiled/libschily.a
> recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a
> recipe-sysroot-native/usr/lib/profiled/libhfs.a
> recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a
> recipe-sysroot-native/usr/lib/profiled/libscg.a
> recipe-sysroot-native/usr/lib/profiled/libfile.a
> recipe-sysroot-native/usr/lib/profiled/libparanoia.a
> recipe-sysroot-native/usr/lib/profiled/libdeflt.a
> recipe-sysroot-native/usr/lib/profiled/libmdigest.a
> recipe-sysroot-native/usr/lib/profiled/librscg.a
> recipe-sysroot-native/usr/lib/profiled/libsiconv.a
> recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a
> recipe-sysroot-native/usr/lib/profiled/libscgcmd.a
> recipe-sysroot-native/usr/lib/libmdigest.a
> recipe-sysroot-native/usr/lib/librscg.a
> recipe-sysroot-native/usr/lib/libsiconv.a
> recipe-sysroot-native/usr/lib/libedc_ecc.a
> recipe-sysroot-native/usr/lib/libscgcmd.a
> recipe-sysroot-native/usr/include/
> recipe-sysroot-native/usr/include/scg/
> recipe-sysroot-native/usr/include/scg/scgio.h
> recipe-sysroot-native/usr/include/scg/scsidefs.h
> recipe-sysroot-native/usr/include/scg/scsicdb.h
> recipe-sysroot-native/usr/include/scg/scgcmd.h
> recipe-sysroot-native/usr/include/scg/scsireg.h
> tar: recipe-sysroot-native/usr/lib/siconv/cp10000: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp737: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-11: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp866: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp860: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-7: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-8: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp869: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-10: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp1252: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp850: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp863: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp865: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp1255: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp1256: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/koi8-r: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp1253: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp862: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp10079: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp874: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/cp1251: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-3: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/libparanoia.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/libdeflt.a: Cannot open: Permission 
> denied
> tar: recipe-sysroot-native/usr/lib/profiled/libfind.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libschily.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a: Cannot 
> open: Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libhfs.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a: Cannot 
> open: Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libscg.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libfile.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libparanoia.a: Cannot 
> open: Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libdeflt.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libmdigest.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/librscg.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libsiconv.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/profiled/libscgcmd.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/libmdigest.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/librscg.a: Cannot open: Permission 
> denied
> tar: recipe-sysroot-native/usr/lib/libsiconv.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/libedc_ecc.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/lib/libscgcmd.a: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/scg/scgio.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/scg/scsidefs.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/scg/scsicdb.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/scg/scgcmd.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/scg/scsireg.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/scg/scsitransp.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/scsitransp.h
> recipe-sysroot-native/usr/include/scg/srb_os2.h
> recipe-sysroot-native/usr/include/scg/scgops.h
> tar: recipe-sysroot-native/usr/include/scg/srb_os2.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/scg/scgops.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/aspi-win32.h
> recipe-sysroot-native/usr/include/scg/spti-wnt.h
> tar: recipe-sysroot-native/usr/include/scg/aspi-win32.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/scg/spti-wnt.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/aspi-dos.h
> recipe-sysroot-native/usr/include/scg/scsisense.h
> tar: recipe-sysroot-native/usr/include/scg/aspi-dos.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/scg/scsisense.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/
> recipe-sysroot-native/usr/include/schily/checkerr.h
> recipe-sysroot-native/usr/include/schily/locale.h
> tar: recipe-sysroot-native/usr/include/schily/checkerr.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/locale.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/timeb.h
> tar: recipe-sysroot-native/usr/include/schily/timeb.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/time.h
> recipe-sysroot-native/usr/include/schily/stdint.h
> tar: recipe-sysroot-native/usr/include/schily/time.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/stdint.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/inttypes.h
> recipe-sysroot-native/usr/include/schily/io.h
> tar: recipe-sysroot-native/usr/include/schily/inttypes.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/io.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/stdio.h
> recipe-sysroot-native/usr/include/schily/siconv.h
> tar: recipe-sysroot-native/usr/include/schily/stdio.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/siconv.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/deflts.h
> recipe-sysroot-native/usr/include/schily/math.h
> tar: recipe-sysroot-native/usr/include/schily/deflts.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/math.h: Cannot 
> openrecipe-sysroot-native/usr/include/schily/schilyp.h
> : Permission denied
> tar: recipe-sysroot-native/usr/include/schily/schilyp.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/systeminfo.h
> recipe-sysroot-native/usr/include/schily/device.h
> tar: recipe-sysroot-native/usr/include/schily/systeminfo.h: Cannot 
> open: Permission denied
> tar: recipe-sysroot-native/usr/include/schily/device.h: Cannot 
> openrecipe-sysroot-native/usr/include/schily/limits.h
> : Permission denied
> tar: recipe-sysroot-native/usr/include/schily/limits.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/alloca.h
> tar: recipe-sysroot-native/usr/include/schily/alloca.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/ioctl.h
> recipe-sysroot-native/usr/include/schily/maxpath.h
> tar: recipe-sysroot-native/usr/include/schily/ioctl.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/maxpath.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/fnmatch.h
> tar: recipe-sysroot-native/usr/include/schily/fnmatch.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/times.h
> tar: recipe-sysroot-native/usr/include/schily/times.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/sem.h
> recipe-sysroot-native/usr/include/schily/err_arch.h
> tar: recipe-sysroot-native/usr/include/schily/sem.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/err_arch.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/signal.h
> recipe-sysroot-native/usr/include/schily/standard.h
> tar: recipe-sysroot-native/usr/include/schily/signal.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/standard.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/wchar.h
> recipe-sysroot-native/usr/include/schily/in.h
> tar: recipe-sysroot-native/usr/include/schily/wchar.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/in.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/libport.h
> recipe-sysroot-native/usr/include/schily/avoffset.h
> tar: recipe-sysroot-native/usr/include/schily/libport.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/avoffset.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/termcap.h
> recipe-sysroot-native/usr/include/schily/rmtio.h
> tar: recipe-sysroot-native/usr/include/schily/termcap.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/rmtio.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/assert.h
> recipe-sysroot-native/usr/include/schily/xconfig.h
> tar: recipe-sysroot-native/usr/include/schily/assert.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/xconfig.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/sigblk.h
> tar: recipe-sysroot-native/usr/include/schily/sigblk.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/stat.h
> recipe-sysroot-native/usr/include/schily/intcvt.h
> tar: recipe-sysroot-native/usr/include/schily/stat.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/stkframe.h
> tar: recipe-sysroot-native/usr/include/schily/intcvt.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/mman.h
> recipe-sysroot-native/usr/include/schily/wctype.h
> recipe-sysroot-native/usr/include/schily/dlfcn.h
> recipe-sysroot-native/usr/include/schily/hostname.h
> recipe-sysroot-native/usr/include/schily/wait.h
> recipe-sysroot-native/usr/include/schily/rmd160.h
> recipe-sysroot-native/usr/include/schily/walk.h
> recipe-sysroot-native/usr/include/schily/varargs.h
> recipe-sysroot-native/usr/include/schily/md5.h
> recipe-sysroot-native/usr/include/schily/nlsdefs.h
> recipe-sysroot-native/usr/include/schily/archdefs.h
> recipe-sysroot-native/usr/include/schily/ctype.h
> recipe-sysroot-native/usr/include/schily/pwd.h
> recipe-sysroot-native/usr/include/schily/err_type.h
> recipe-sysroot-native/usr/include/schily/inet.h
> tar: recipe-sysroot-native/usr/include/schily/stkframe.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/mman.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/wctype.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/dlfcn.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/hostname.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/wait.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/rmd160.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/walk.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/varargs.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/md5.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/nlsdefs.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/archdefs.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/ctype.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/pwd.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/err_type.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/schily.h
> recipe-sysroot-native/usr/include/schily/float.h
> recipe-sysroot-native/usr/include/schily/patmatch.h
> recipe-sysroot-native/usr/include/schily/netdb.h
> recipe-sysroot-native/usr/include/schily/setjmp.h
> recipe-sysroot-native/usr/include/schily/ipc.h
> recipe-sysroot-native/usr/include/schily/libgen.h
> recipe-sysroot-native/usr/include/schily/shadow.h
> recipe-sysroot-native/usr/include/schily/types.h
> recipe-sysroot-native/usr/include/schily/sysexits.h
> recipe-sysroot-native/usr/include/schily/grp.h
> recipe-sysroot-native/usr/include/schily/fstream.h
> tar: recipe-sysroot-native/usr/include/schily/inet.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/schily.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/float.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/patmatch.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/netdb.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/setjmp.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/ipc.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/libgen.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/shadow.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/types.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/sysexits.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/grp.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/shm.h
> recipe-sysroot-native/usr/include/schily/sunos4_proto.h
> recipe-sysroot-native/usr/include/schily/err_char.h
> recipe-sysroot-native/usr/include/schily/mtio.h
> recipe-sysroot-native/usr/include/schily/librmt.h
> recipe-sysroot-native/usr/include/schily/idcache.h
> recipe-sysroot-native/usr/include/schily/_regex.h
> recipe-sysroot-native/usr/include/schily/utime.h
> recipe-sysroot-native/usr/include/schily/shedit.h
> recipe-sysroot-native/usr/include/schily/string.h
> recipe-sysroot-native/usr/include/schily/btorder.h
> recipe-sysroot-native/usr/include/schily/md4.h
> recipe-sysroot-native/usr/include/schily/prototyp.h
> recipe-sysroot-native/usr/include/schily/mconfig.h
> tar: recipe-sysroot-native/usr/include/schily/fstream.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/shm.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/sunos4_proto.h: Cannot 
> open: Permission denied
> tar: recipe-sysroot-native/usr/include/schily/err_char.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/mtio.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/librmt.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/idcache.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/_regex.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/utime.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/shedit.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/string.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/btorder.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/md4.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/prototyp.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/mconfig.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/find.h
> recipe-sysroot-native/usr/include/schily/fetchdir.h
> tar: recipe-sysroot-native/usr/include/schily/find.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/fetchdir.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/err_bit.h
> recipe-sysroot-native/usr/include/schily/regex.h
> tar: recipe-sysroot-native/usr/include/schily/err_bit.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/ccomdefs.h
> tar: recipe-sysroot-native/usr/include/schily/regex.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/ccomdefs.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/resource.h
> recipe-sysroot-native/usr/include/schily/sha2.h
> tar: recipe-sysroot-native/usr/include/schily/resource.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/param.h
> tar: recipe-sysroot-native/usr/include/schily/sha2.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/param.h: Cannot 
> openrecipe-sysroot-native/usr/include/schily/fcntl.h
> : Permission denied
> tar: recipe-sysroot-native/usr/include/schily/fcntl.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/sha1.h
> recipe-sysroot-native/usr/include/schily/stdarg.h
> tar: recipe-sysroot-native/usr/include/schily/sha1.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/stdarg.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/sigset.h
> tar: recipe-sysroot-native/usr/include/schily/sigset.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/termios.h
> tar: recipe-sysroot-native/usr/include/schily/termios.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/align.h
> recipe-sysroot-native/usr/include/schily/errno.h
> tar: recipe-sysroot-native/usr/include/schily/align.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/errno.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/socket.h
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h
> tar: recipe-sysroot-native/usr/include/schily/socket.h: Cannot open: 
> Permission denied
> tar: 
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h: 
> Cannot open: Permission denied
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h
> tar: 
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h: 
> Cannot open: Permission denied
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h
> tar: 
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h: 
> Cannot open: Permission denied
> recipe-sysroot-native/usr/include/schily/unistd.h
> recipe-sysroot-native/usr/include/schily/dirent.h
> recipe-sysroot-native/usr/include/schily/select.h
> recipe-sysroot-native/usr/include/schily/poll.h
> recipe-sysroot-native/usr/include/schily/procfs.h
> recipe-sysroot-native/usr/include/schily/stdlib.h
> recipe-sysroot-native/usr/include/schily/getargs.h
> recipe-sysroot-native/usr/include/schily/jmpdefs.h
> recipe-sysroot-native/usr/include/schily/vfork.h
> tar: recipe-sysroot-native/usr/include/schily/unistd.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/dirent.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/select.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/poll.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/procfs.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/stdlib.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/getargs.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/jmpdefs.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/vfork.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/windows.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/windows.h
> recipe-sysroot-native/usr/include/schily/shcall.h
> recipe-sysroot-native/usr/include/schily/utypes.h
> tar: recipe-sysroot-native/usr/include/schily/shcall.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/xmconfig.h
> tar: recipe-sysroot-native/usr/include/schily/utypes.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/xmconfig.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/utsname.h
> recipe-sysroot-native/usr/include/schily/getcwd.h
> tar: recipe-sysroot-native/usr/include/schily/utsname.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/getcwd.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/syslog.h
> recipe-sysroot-native/usr/include/schily/priv.h
> tar: recipe-sysroot-native/usr/include/schily/syslog.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/priv.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/iconv.h
> recipe-sysroot-native/usr/include/schily/dbgmalloc.h
> tar: recipe-sysroot-native/usr/include/schily/iconv.h: Cannot open: 
> Permission denied
> tar: recipe-sysroot-native/usr/include/schily/dbgmalloc.h: Cannot 
> open: Permission denied
> tar: Exiting with failure status due to previous errors
> WARNING: exit code 2 from a shell command.
> DEBUG: Python function do_populate_sysroot_setscene finishe
>
> Sure enough, if I manually try an extraction, I see the same issue:
>
> tar -I zstd --format=posix --acls --xattrs -xvpf 
> ../sstate\:cdrtools-native\:x86_64-linux\:3.01\:r0\:x86_64\:11\:aa6350f6565599ed04df25250bb5415c0e2427b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst
> recipe-sysroot-native/
> recipe-sysroot-native/sysroot-providers/
> recipe-sysroot-native/sysroot-providers/cdrtools-native
> recipe-sysroot-native/usr/
> recipe-sysroot-native/usr/bin/
> recipe-sysroot-native/usr/bin/cdda2ogg
> recipe-sysroot-native/usr/bin/cdda2wav
> recipe-sysroot-native/usr/bin/mkhybrid
> recipe-sysroot-native/usr/bin/devdump
> recipe-sysroot-native/usr/bin/isodebug
> recipe-sysroot-native/usr/bin/scgskeleton
> recipe-sysroot-native/usr/bin/btcflash
> recipe-sysroot-native/usr/bin/cdrecord
> recipe-sysroot-native/usr/bin/readcd
> recipe-sysroot-native/usr/bin/isoinfo
> recipe-sysroot-native/usr/bin/isodump
> recipe-sysroot-native/usr/bin/cdda2mp3
> recipe-sysroot-native/usr/bin/scgcheck
> recipe-sysroot-native/usr/bin/mkisofs
> recipe-sysroot-native/usr/bin/isovfy
> recipe-sysroot-native/usr/sbin/
> recipe-sysroot-native/usr/sbin/rscsi
> recipe-sysroot-native/usr/share/
> recipe-sysroot-native/usr/lib/
> recipe-sysroot-native/usr/lib/libfind.a
> tar: recipe-sysroot-native/usr/lib/libfind.a: Cannot open: Permission 
> denied
> recipe-sysroot-native/usr/lib/libschily.a
> tar: recipe-sysroot-native/usr/lib/libschily.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/libedc_ecc_dec.a
> tar: recipe-sysroot-native/usr/lib/libedc_ecc_dec.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/libhfs.a
> tar: recipe-sysroot-native/usr/lib/libhfs.a: Cannot open: Permission 
> denied
> recipe-sysroot-native/usr/lib/libcdrdeflt.a
> tar: recipe-sysroot-native/usr/lib/libcdrdeflt.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/libscg.a
> tar: recipe-sysroot-native/usr/lib/libscg.a: Cannot open: Permission 
> denied
> recipe-sysroot-native/usr/lib/libfile.a
> tar: recipe-sysroot-native/usr/lib/libfile.a: Cannot open: Permission 
> denied
> recipe-sysroot-native/usr/lib/siconv/
> recipe-sysroot-native/usr/lib/siconv/cp10006
> tar: recipe-sysroot-native/usr/lib/siconv/cp10006: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-16
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-16: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-9
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-9: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp10007
> tar: recipe-sysroot-native/usr/lib/siconv/cp10007: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp10029
> tar: recipe-sysroot-native/usr/lib/siconv/cp10029: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-6
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-6: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-4
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-4: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp1257
> tar: recipe-sysroot-native/usr/lib/siconv/cp1257: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-13
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-13: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-2
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-2: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp437
> tar: recipe-sysroot-native/usr/lib/siconv/cp437: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp775
> tar: recipe-sysroot-native/usr/lib/siconv/cp775: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-15
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-15: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp857
> tar: recipe-sysroot-native/usr/lib/siconv/cp857: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp1258
> tar: recipe-sysroot-native/usr/lib/siconv/cp1258: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp855
> tar: recipe-sysroot-native/usr/lib/siconv/cp855: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp864
> tar: recipe-sysroot-native/usr/lib/siconv/cp864: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-5
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-5: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp1254
> tar: recipe-sysroot-native/usr/lib/siconv/cp1254: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-1
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-1: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp861
> tar: recipe-sysroot-native/usr/lib/siconv/cp861: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/koi8-u
> tar: recipe-sysroot-native/usr/lib/siconv/koi8-u: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp10081
> tar: recipe-sysroot-native/usr/lib/siconv/cp10081: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-14
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-14: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp852
> tar: recipe-sysroot-native/usr/lib/siconv/cp852: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp1250
> tar: recipe-sysroot-native/usr/lib/siconv/cp1250: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp10000
> tar: recipe-sysroot-native/usr/lib/siconv/cp10000: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp737
> tar: recipe-sysroot-native/usr/lib/siconv/cp737: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-11
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-11: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp866
> tar: recipe-sysroot-native/usr/lib/siconv/cp866: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp860
> tar: recipe-sysroot-native/usr/lib/siconv/cp860: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-7
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-7: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-8
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-8: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp869
> tar: recipe-sysroot-native/usr/lib/siconv/cp869: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-10
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-10: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp1252
> tar: recipe-sysroot-native/usr/lib/siconv/cp1252: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp850
> tar: recipe-sysroot-native/usr/lib/siconv/cp850: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp863
> tar: recipe-sysroot-native/usr/lib/siconv/cp863: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp865
> tar: recipe-sysroot-native/usr/lib/siconv/cp865: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp1255
> tar: recipe-sysroot-native/usr/lib/siconv/cp1255: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp1256
> tar: recipe-sysroot-native/usr/lib/siconv/cp1256: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/koi8-r
> tar: recipe-sysroot-native/usr/lib/siconv/koi8-r: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp1253
> tar: recipe-sysroot-native/usr/lib/siconv/cp1253: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp862
> tar: recipe-sysroot-native/usr/lib/siconv/cp862: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp10079
> tar: recipe-sysroot-native/usr/lib/siconv/cp10079: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp874
> tar: recipe-sysroot-native/usr/lib/siconv/cp874: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/cp1251
> tar: recipe-sysroot-native/usr/lib/siconv/cp1251: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/siconv/iso8859-3
> tar: recipe-sysroot-native/usr/lib/siconv/iso8859-3: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/libparanoia.a
> tar: recipe-sysroot-native/usr/lib/libparanoia.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/libdeflt.a
> tar: recipe-sysroot-native/usr/lib/libdeflt.a: Cannot open: Permission 
> denied
> recipe-sysroot-native/usr/lib/profiled/
> recipe-sysroot-native/usr/lib/profiled/libfind.a
> tar: recipe-sysroot-native/usr/lib/profiled/libfind.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/profiled/libschily.a
> tar: recipe-sysroot-native/usr/lib/profiled/libschily.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a
> tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a: Cannot 
> open: Permission denied
> recipe-sysroot-native/usr/lib/profiled/libhfs.a
> tar: recipe-sysroot-native/usr/lib/profiled/libhfs.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a
> tar: recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a: Cannot 
> open: Permission denied
> recipe-sysroot-native/usr/lib/profiled/libscg.a
> tar: recipe-sysroot-native/usr/lib/profiled/libscg.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/profiled/libfile.a
> tar: recipe-sysroot-native/usr/lib/profiled/libfile.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/profiled/libparanoia.a
> tar: recipe-sysroot-native/usr/lib/profiled/libparanoia.a: Cannot 
> open: Permission denied
> recipe-sysroot-native/usr/lib/profiled/libdeflt.a
> tar: recipe-sysroot-native/usr/lib/profiled/libdeflt.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/profiled/libmdigest.a
> tar: recipe-sysroot-native/usr/lib/profiled/libmdigest.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/profiled/librscg.a
> tar: recipe-sysroot-native/usr/lib/profiled/librscg.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/profiled/libsiconv.a
> tar: recipe-sysroot-native/usr/lib/profiled/libsiconv.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a
> tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/profiled/libscgcmd.a
> tar: recipe-sysroot-native/usr/lib/profiled/libscgcmd.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/libmdigest.a
> tar: recipe-sysroot-native/usr/lib/libmdigest.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/librscg.a
> tar: recipe-sysroot-native/usr/lib/librscg.a: Cannot open: Permission 
> denied
> recipe-sysroot-native/usr/lib/libsiconv.a
> tar: recipe-sysroot-native/usr/lib/libsiconv.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/libedc_ecc.a
> tar: recipe-sysroot-native/usr/lib/libedc_ecc.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/lib/libscgcmd.a
> tar: recipe-sysroot-native/usr/lib/libscgcmd.a: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/
> recipe-sysroot-native/usr/include/scg/
> recipe-sysroot-native/usr/include/scg/scgio.h
> tar: recipe-sysroot-native/usr/include/scg/scgio.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/scsidefs.h
> tar: recipe-sysroot-native/usr/include/scg/scsidefs.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/scsicdb.h
> tar: recipe-sysroot-native/usr/include/scg/scsicdb.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/scgcmd.h
> tar: recipe-sysroot-native/usr/include/scg/scgcmd.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/scsireg.h
> tar: recipe-sysroot-native/usr/include/scg/scsireg.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/scsitransp.h
> tar: recipe-sysroot-native/usr/include/scg/scsitransp.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/srb_os2.h
> tar: recipe-sysroot-native/usr/include/scg/srb_os2.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/scgops.h
> tar: recipe-sysroot-native/usr/include/scg/scgops.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/aspi-win32.h
> tar: recipe-sysroot-native/usr/include/scg/aspi-win32.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/spti-wnt.h
> tar: recipe-sysroot-native/usr/include/scg/spti-wnt.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/aspi-dos.h
> tar: recipe-sysroot-native/usr/include/scg/aspi-dos.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/scg/scsisense.h
> tar: recipe-sysroot-native/usr/include/scg/scsisense.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/
> recipe-sysroot-native/usr/include/schily/checkerr.h
> tar: recipe-sysroot-native/usr/include/schily/checkerr.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/locale.h
> tar: recipe-sysroot-native/usr/include/schily/locale.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/timeb.h
> tar: recipe-sysroot-native/usr/include/schily/timeb.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/time.h
> tar: recipe-sysroot-native/usr/include/schily/time.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/stdint.h
> tar: recipe-sysroot-native/usr/include/schily/stdint.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/inttypes.h
> tar: recipe-sysroot-native/usr/include/schily/inttypes.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/io.h
> tar: recipe-sysroot-native/usr/include/schily/io.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/stdio.h
> tar: recipe-sysroot-native/usr/include/schily/stdio.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/siconv.h
> tar: recipe-sysroot-native/usr/include/schily/siconv.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/deflts.h
> tar: recipe-sysroot-native/usr/include/schily/deflts.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/math.h
> tar: recipe-sysroot-native/usr/include/schily/math.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/schilyp.h
> tar: recipe-sysroot-native/usr/include/schily/schilyp.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/systeminfo.h
> tar: recipe-sysroot-native/usr/include/schily/systeminfo.h: Cannot 
> open: Permission denied
> recipe-sysroot-native/usr/include/schily/device.h
> tar: recipe-sysroot-native/usr/include/schily/device.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/limits.h
> tar: recipe-sysroot-native/usr/include/schily/limits.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/alloca.h
> tar: recipe-sysroot-native/usr/include/schily/alloca.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/ioctl.h
> tar: recipe-sysroot-native/usr/include/schily/ioctl.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/maxpath.h
> tar: recipe-sysroot-native/usr/include/schily/maxpath.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/fnmatch.h
> tar: recipe-sysroot-native/usr/include/schily/fnmatch.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/times.h
> tar: recipe-sysroot-native/usr/include/schily/times.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/sem.h
> tar: recipe-sysroot-native/usr/include/schily/sem.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/err_arch.h
> tar: recipe-sysroot-native/usr/include/schily/err_arch.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/signal.h
> tar: recipe-sysroot-native/usr/include/schily/signal.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/standard.h
> tar: recipe-sysroot-native/usr/include/schily/standard.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/wchar.h
> tar: recipe-sysroot-native/usr/include/schily/wchar.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/in.h
> tar: recipe-sysroot-native/usr/include/schily/in.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/libport.h
> tar: recipe-sysroot-native/usr/include/schily/libport.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/avoffset.h
> tar: recipe-sysroot-native/usr/include/schily/avoffset.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/termcap.h
> tar: recipe-sysroot-native/usr/include/schily/termcap.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/rmtio.h
> tar: recipe-sysroot-native/usr/include/schily/rmtio.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/assert.h
> tar: recipe-sysroot-native/usr/include/schily/assert.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/xconfig.h
> tar: recipe-sysroot-native/usr/include/schily/xconfig.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/sigblk.h
> tar: recipe-sysroot-native/usr/include/schily/sigblk.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/stat.h
> tar: recipe-sysroot-native/usr/include/schily/stat.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/intcvt.h
> tar: recipe-sysroot-native/usr/include/schily/intcvt.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/stkframe.h
> tar: recipe-sysroot-native/usr/include/schily/stkframe.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/mman.h
> tar: recipe-sysroot-native/usr/include/schily/mman.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/wctype.h
> tar: recipe-sysroot-native/usr/include/schily/wctype.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/dlfcn.h
> tar: recipe-sysroot-native/usr/include/schily/dlfcn.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/hostname.h
> tar: recipe-sysroot-native/usr/include/schily/hostname.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/wait.h
> tar: recipe-sysroot-native/usr/include/schily/wait.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/rmd160.h
> tar: recipe-sysroot-native/usr/include/schily/rmd160.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/walk.h
> tar: recipe-sysroot-native/usr/include/schily/walk.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/varargs.h
> tar: recipe-sysroot-native/usr/include/schily/varargs.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/md5.h
> tar: recipe-sysroot-native/usr/include/schily/md5.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/nlsdefs.h
> tar: recipe-sysroot-native/usr/include/schily/nlsdefs.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/archdefs.h
> tar: recipe-sysroot-native/usr/include/schily/archdefs.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/ctype.h
> tar: recipe-sysroot-native/usr/include/schily/ctype.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/pwd.h
> tar: recipe-sysroot-native/usr/include/schily/pwd.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/err_type.h
> tar: recipe-sysroot-native/usr/include/schily/err_type.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/inet.h
> tar: recipe-sysroot-native/usr/include/schily/inet.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/schily.h
> tar: recipe-sysroot-native/usr/include/schily/schily.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/float.h
> tar: recipe-sysroot-native/usr/include/schily/float.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/patmatch.h
> tar: recipe-sysroot-native/usr/include/schily/patmatch.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/netdb.h
> tar: recipe-sysroot-native/usr/include/schily/netdb.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/setjmp.h
> tar: recipe-sysroot-native/usr/include/schily/setjmp.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/ipc.h
> tar: recipe-sysroot-native/usr/include/schily/ipc.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/libgen.h
> tar: recipe-sysroot-native/usr/include/schily/libgen.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/shadow.h
> tar: recipe-sysroot-native/usr/include/schily/shadow.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/types.h
> tar: recipe-sysroot-native/usr/include/schily/types.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/sysexits.h
> tar: recipe-sysroot-native/usr/include/schily/sysexits.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/grp.h
> tar: recipe-sysroot-native/usr/include/schily/grp.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/fstream.h
> tar: recipe-sysroot-native/usr/include/schily/fstream.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/shm.h
> tar: recipe-sysroot-native/usr/include/schily/shm.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/sunos4_proto.h
> tar: recipe-sysroot-native/usr/include/schily/sunos4_proto.h: Cannot 
> open: Permission denied
> recipe-sysroot-native/usr/include/schily/err_char.h
> tar: recipe-sysroot-native/usr/include/schily/err_char.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/mtio.h
> tar: recipe-sysroot-native/usr/include/schily/mtio.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/librmt.h
> tar: recipe-sysroot-native/usr/include/schily/librmt.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/idcache.h
> tar: recipe-sysroot-native/usr/include/schily/idcache.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/_regex.h
> tar: recipe-sysroot-native/usr/include/schily/_regex.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/utime.h
> tar: recipe-sysroot-native/usr/include/schily/utime.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/shedit.h
> tar: recipe-sysroot-native/usr/include/schily/shedit.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/string.h
> tar: recipe-sysroot-native/usr/include/schily/string.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/btorder.h
> tar: recipe-sysroot-native/usr/include/schily/btorder.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/md4.h
> tar: recipe-sysroot-native/usr/include/schily/md4.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/prototyp.h
> tar: recipe-sysroot-native/usr/include/schily/prototyp.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/mconfig.h
> tar: recipe-sysroot-native/usr/include/schily/mconfig.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/find.h
> tar: recipe-sysroot-native/usr/include/schily/find.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/fetchdir.h
> tar: recipe-sysroot-native/usr/include/schily/fetchdir.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/err_bit.h
> tar: recipe-sysroot-native/usr/include/schily/err_bit.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/regex.h
> tar: recipe-sysroot-native/usr/include/schily/regex.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/ccomdefs.h
> tar: recipe-sysroot-native/usr/include/schily/ccomdefs.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/resource.h
> tar: recipe-sysroot-native/usr/include/schily/resource.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/sha2.h
> tar: recipe-sysroot-native/usr/include/schily/sha2.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/param.h
> tar: recipe-sysroot-native/usr/include/schily/param.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/fcntl.h
> tar: recipe-sysroot-native/usr/include/schily/fcntl.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/sha1.h
> tar: recipe-sysroot-native/usr/include/schily/sha1.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/stdarg.h
> tar: recipe-sysroot-native/usr/include/schily/stdarg.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/sigset.h
> tar: recipe-sysroot-native/usr/include/schily/sigset.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/termios.h
> tar: recipe-sysroot-native/usr/include/schily/termios.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/align.h
> tar: recipe-sysroot-native/usr/include/schily/align.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/errno.h
> tar: recipe-sysroot-native/usr/include/schily/errno.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/socket.h
> tar: recipe-sysroot-native/usr/include/schily/socket.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h
> tar: 
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h: 
> Cannot open: Permission denied
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h
> tar: 
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h: 
> Cannot open: Permission denied
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h
> tar: 
> recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h: 
> Cannot open: Permission denied
> recipe-sysroot-native/usr/include/schily/unistd.h
> tar: recipe-sysroot-native/usr/include/schily/unistd.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/dirent.h
> tar: recipe-sysroot-native/usr/include/schily/dirent.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/select.h
> tar: recipe-sysroot-native/usr/include/schily/select.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/poll.h
> tar: recipe-sysroot-native/usr/include/schily/poll.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/procfs.h
> tar: recipe-sysroot-native/usr/include/schily/procfs.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/stdlib.h
> tar: recipe-sysroot-native/usr/include/schily/stdlib.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/getargs.h
> tar: recipe-sysroot-native/usr/include/schily/getargs.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/jmpdefs.h
> tar: recipe-sysroot-native/usr/include/schily/jmpdefs.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/vfork.h
> tar: recipe-sysroot-native/usr/include/schily/vfork.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/windows.h
> tar: recipe-sysroot-native/usr/include/schily/windows.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/shcall.h
> tar: recipe-sysroot-native/usr/include/schily/shcall.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/utypes.h
> tar: recipe-sysroot-native/usr/include/schily/utypes.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/xmconfig.h
> tar: recipe-sysroot-native/usr/include/schily/xmconfig.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/utsname.h
> tar: recipe-sysroot-native/usr/include/schily/utsname.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/getcwd.h
> tar: recipe-sysroot-native/usr/include/schily/getcwd.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/syslog.h
> tar: recipe-sysroot-native/usr/include/schily/syslog.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/priv.h
> tar: recipe-sysroot-native/usr/include/schily/priv.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/iconv.h
> tar: recipe-sysroot-native/usr/include/schily/iconv.h: Cannot open: 
> Permission denied
> recipe-sysroot-native/usr/include/schily/dbgmalloc.h
> tar: recipe-sysroot-native/usr/include/schily/dbgmalloc.h: Cannot 
> open: Permission denied
> tar: Exiting with failure status due to previous errors
>
> The files in question are readonly so it looks like it creates the file
> readonly and then can't write the xattr data to it. If I drop the --
> xattrs parameter to tar, it works.
>
> The version of tar in question is:
>
> pokybuild@debian11-ty-1:~/yocto-worker/wic/build/1$ tar --version
> tar (GNU tar) 1.34
> Copyright (C) 2021 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later 
> <https://gnu.org/licenses/gpl.html 
> <https://gnu.org/licenses/gpl.html>>.
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
>
> Written by John Gilmore and Jay Fenlason.
>
>
> Cheers,
>
> Richard
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186819):https://lists.openembedded.org/g/openembedded-core/message/186819
> Mute This Topic:https://lists.openembedded.org/mt/101006112/7527613
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [p.lobacz@welotec.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------22ifhH0VXpUptkwIn0nyt0Lw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>OK Richard, according to this link
      <a class="moz-txt-link-freetext" href="https://github.com/praiskup/tar/pull/2">https://github.com/praiskup/tar/pull/2</a> they have fixed it in 1.35
      release...</p>
    <p><br>
    </p>
    <p></p>
    <div class="moz-cite-prefix">W dniu 28.08.2023 o&nbsp;10:44, Piotr Łobacz
      via lists.openembedded.org pisze:<br>
    </div>
    <blockquote type="cite" cite="mid:177F7F952788FCE3.29523@lists.openembedded.org">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
        Hi Richard,</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof
        ContentPasted0">
        I have discovered in here <a href="https://savannah.gnu.org/bugs/?59184" originalsrc="https://savannah.gnu.org/bugs/?59184" shash="EFr/JhXl3krOLZSP9kyUHL13dVt74qdRbZaXnjUejOnAJALbAwmWiCyd+hQyx1wP/6NHG9t9aYrOnJujiS2g5lmYSM2+gIBnD+aR03++WAJjLnQQ3jvqaOrs8SD5GL2J44lrJSj0WMp1MgaIhzwyhoJquat3aUgV/2XEBpghBiQ=" id="LPlnk403647" moz-do-not-send="true">
          https://savannah.gnu.org/bugs/?59184</a> that this is a bug in
        tar, which is already reported. The solution, which is given out
        there is ugly, but on the other hand solution which will be
        added to tar will cause also to update machines so we need
        probably to discuss the best option for us...</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof
        ContentPasted0">
        <br>
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof
        ContentPasted0">
        BR</div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof
        ContentPasted0">
        Piotr<br>
      </div>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>Od:</b> Richard
          Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
          <b>Wysłane:</b> czwartek, 24 sierpnia 2023 09:08<br>
          <b>Do:</b> Piotr Łobacz <a class="moz-txt-link-rfc2396E" href="mailto:p.lobacz@welotec.com">&lt;p.lobacz@welotec.com&gt;</a>;
          <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
          <b>Temat:</b> Re: [OE-Core][PATCH v12 4/7] sstate.bbclass: add
          support for ACLs and xattr</font>
        <div>&nbsp;</div>
      </div>
      <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
            <div class="PlainText">On Fri, 2023-08-04 at 10:43 +0200,
              Piotr Łobacz wrote:<br>
              Extend `tar` command, with additional parameters,
              depending<br>
              on choosen package class and target distro features, in
              order<br>
              to support ACLs and xattr.<br>
              <br>
              Additionaly set archive posix format, in order to preserve<br>
              milliseconds in timestamps for reproducibility tests.<br>
              <br>
              Currently only `package_ipk` supports fully ACLs and
              xattr.<br>
              <br>
              Signed-off-by: Piotr Łobacz <a class="moz-txt-link-rfc2396E" href="mailto:p.lobacz@welotec.com">&lt;p.lobacz@welotec.com&gt;</a><br>
              ---<br>
              &nbsp;meta/classes-global/sstate.bbclass | 4 ++--<br>
              &nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/meta/classes-global/sstate.bbclass
              b/meta/classes-global/sstate.bbclass<br>
              index 95373fd60a..ac890fc98e 100644<br>
              --- a/meta/classes-global/sstate.bbclass<br>
              +++ b/meta/classes-global/sstate.bbclass<br>
              @@ -848,7 +848,7 @@ sstate_create_package () {<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir --mode=0775 -p `dirname ${SSTATE_PKG}`<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`<br>
              &nbsp;<br>
              -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPT=&quot;-cS&quot;<br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPT=&quot;--format=posix
              ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls',
              '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr',
              '--xattrs', '', d)} --numeric-owner -cS&quot;<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZSTD=&quot;zstd -${SSTATE_ZSTD_CLEVEL}
              -T${ZSTD_THREADS}&quot;<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Use pzstd if available<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -x &quot;$(command -v pzstd)&quot; ]; then<br>
              @@ -914,7 +914,7 @@ sstate_unpack_package () {<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZSTD=&quot;pzstd -p ${ZSTD_THREADS}&quot;<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
              &nbsp;<br>
              -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tar -I &quot;$ZSTD&quot; -xvpf ${SSTATE_PKG}<br>
              +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tar -I &quot;$ZSTD&quot; --format=posix
              ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls',
              '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr',
              '--xattrs', '', d)} -xvpf ${SSTATE_PKG}<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # update .siginfo atime on local/NFS mirror if it
              is a symbolic link<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e
              ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo
              2&gt;/dev/null || true<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # update each symbolic link instead of any
              referenced file<br>
              <br>
              I've been putting this through a bit more testing and
              sadly we're still not quite there. In testing last night
              we saw a lot of failures like this:<br>
              <br>
              <a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/7488" originalsrc="https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/7488" shash="dHXVlhD55YH0ARwD3gF5esCr2/+zzE5cToAdPbra7j4ckH5PyU+3eZniBL9u0mVZ86Mf4ZfCbavSR3bZJmTD0ipjwKmD8P6ELrjgiSYLK+M9cfrZI1FM/sDAjnlfhL83vS0gbmiuskiFIDyKy201YJL/Gye6xl0NFW8gQmdv2xg=" moz-do-not-send="true">https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F58%2Fbuilds%2F7488&amp;data=05%7C01%7Cp.lobacz%40welotec.com%7Cf02568261c5849e1dac308dba470e7ce%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638284577345843928%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=mylIx0P4MLeBaFZclc47CMwX7%2FhEliHECp6e1POGtIg%3D&amp;reserved=0</a><br>
              <br>
              i.e.:<br>
              <br>
              WARNING: cdrtools-native-3.01-r0
              do_populate_sysroot_setscene:
ExecutionError('/home/pokybuild/yocto-worker/wic/build/build/tmp/work/x86_64-linux/cdrtools-native/3.01/temp/run.sstate_unpack_package.1434763',
              2, None, None)<br>
              WARNING: Logfile for failed setscene task is
/home/pokybuild/yocto-worker/wic/build/build/tmp/work/x86_64-linux/cdrtools-native/3.01/temp/log.do_populate_sysroot_setscene.1434763<br>
              WARNING: Setscene task
(/home/pokybuild/yocto-worker/wic/build/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb:do_populate_sysroot_setscene)
              failed with exit code '1' - real task will be run instead<br>
              <br>
              The sstate in question is this file:<br>
              <br>
              <a href="http://sstate.yoctoproject.org/all/universal/aa/63/sstate:cdrtools-native:x86_64-linux:3.01:r0:x86_64:11:aa6350f6565599ed04df25250bb5415c0e2427b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst" originalsrc="http://sstate.yoctoproject.org/all/universal/aa/63/sstate:cdrtools-native:x86_64-linux:3.01:r0:x86_64:11:aa6350f6565599ed04df25250bb5415c0e2427b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst" shash="nXYcd9eIhZMeETq+QUwLJvJ8Ftz7ldN06wDKC0PY8xdbepk4iYHH4X9UmBrTxU2EQQPpR5P3aAI00ZiRBlSRyhuFPWCvKJZ38REXZ03svGSPI+smGV3rJ06QOlezcL0pam5Oaxo26hkSwIcU/puJ6s8nJSwVFKqx0SifxTSFfYw=" moz-do-not-send="true">https://eur04.safelinks.protection.outlook.com/?url=http%3A%2F%2Fsstate.yoctoproject.org%2Fall%2Funiversal%2Faa%2F63%2Fsstate%3Acdrtools-native%3Ax86_64-linux%3A3.01%3Ar0%3Ax86_64%3A11%3Aaa6350f6565599ed04df25250bb5415c0e2427b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst&amp;data=05%7C01%7Cp.lobacz%40welotec.com%7Cf02568261c5849e1dac308dba470e7ce%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638284577345843928%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=IDBC6nZHweWglSxrBrGi2S%2BcXtgAk0CIbs6BX72eolo%3D&amp;reserved=0</a><br>
              <br>
              and the failing task log:<br>
              <br>
<a class="moz-txt-link-abbreviated" href="mailto:pokybuild@debian11-ty-1:~/yocto-worker/wic/build/build/tmp/work/x86_64-linux/cdrtools-native/3.01/temp$">pokybuild@debian11-ty-1:~/yocto-worker/wic/build/build/tmp/work/x86_64-linux/cdrtools-native/3.01/temp$</a>
              cat log.do_populate_sysroot_setscene<br>
              DEBUG: Executing python function
              do_populate_sysroot_setscene<br>
              DEBUG: Executing shell function sstate_unpack_package<br>
              recipe-sysroot-native/<br>
              recipe-sysroot-native/sysroot-providers/<br>
              recipe-sysroot-native/sysroot-providers/cdrtools-native<br>
              recipe-sysroot-native/usr/<br>
              recipe-sysroot-native/usr/bin/<br>
              recipe-sysroot-native/usr/bin/cdda2ogg<br>
              recipe-sysroot-native/usr/bin/cdda2wav<br>
              recipe-sysroot-native/usr/bin/mkhybrid<br>
              recipe-sysroot-native/usr/bin/devdump<br>
              recipe-sysroot-native/usr/bin/isodebug<br>
              recipe-sysroot-native/usr/bin/scgskeleton<br>
              recipe-sysroot-native/usr/bin/btcflash<br>
              recipe-sysroot-native/usr/bin/cdrecord<br>
              recipe-sysroot-native/usr/bin/readcd<br>
              recipe-sysroot-native/usr/bin/isoinfo<br>
              recipe-sysroot-native/usr/bin/isodump<br>
              recipe-sysroot-native/usr/bin/cdda2mp3<br>
              recipe-sysroot-native/usr/bin/scgcheck<br>
              recipe-sysroot-native/usr/bin/mkisofs<br>
              recipe-sysroot-native/usr/bin/isovfy<br>
              recipe-sysroot-native/usr/sbin/<br>
              recipe-sysroot-native/usr/sbin/rscsi<br>
              recipe-sysroot-native/usr/share/<br>
              recipe-sysroot-native/usr/lib/<br>
              recipe-sysroot-native/usr/lib/libfind.a<br>
              recipe-sysroot-native/usr/lib/libschily.a<br>
              recipe-sysroot-native/usr/lib/libedc_ecc_dec.a<br>
              recipe-sysroot-native/usr/lib/libhfs.a<br>
              recipe-sysroot-native/usr/lib/libcdrdeflt.a<br>
              recipe-sysroot-native/usr/lib/libscg.a<br>
              recipe-sysroot-native/usr/lib/libfile.a<br>
              recipe-sysroot-native/usr/lib/siconv/<br>
              recipe-sysroot-native/usr/lib/siconv/cp10006<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-16<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-9<br>
              recipe-sysroot-native/usr/lib/siconv/cp10007<br>
              recipe-sysroot-native/usr/lib/siconv/cp10029<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-6<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-4<br>
              recipe-sysroot-native/usr/lib/siconv/cp1257<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-13<br>
              tar: recipe-sysroot-native/usr/lib/libfind.a: Cannot open:
              Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libschily.a: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libedc_ecc_dec.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libhfs.a: Cannot open:
              Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libcdrdeflt.a: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libscg.a: Cannot open:
              Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libfile.a: Cannot open:
              Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10006: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-16:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-9:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10007: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10029: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-6:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-4:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1257: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-13:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-2<br>
              recipe-sysroot-native/usr/lib/siconv/cp437<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-2:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp437: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp775<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-15<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp775: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-15:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp857<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp857: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp1258<br>
              recipe-sysroot-native/usr/lib/siconv/cp855<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1258: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp855: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp864<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp864: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-5<br>
              recipe-sysroot-native/usr/lib/siconv/cp1254<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-5:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1254: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-1<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-1:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp861<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp861: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/koi8-u<br>
              recipe-sysroot-native/usr/lib/siconv/cp10081<br>
              tar: recipe-sysroot-native/usr/lib/siconv/koi8-u: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10081: Cannot
              openrecipe-sysroot-native/usr/lib/siconv/iso8859-14<br>
              : Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-14:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp852<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp852: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp1250<br>
              recipe-sysroot-native/usr/lib/siconv/cp10000<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1250: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp737<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-11<br>
              recipe-sysroot-native/usr/lib/siconv/cp866<br>
              recipe-sysroot-native/usr/lib/siconv/cp860<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-7<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-8<br>
              recipe-sysroot-native/usr/lib/siconv/cp869<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-10<br>
              recipe-sysroot-native/usr/lib/siconv/cp1252<br>
              recipe-sysroot-native/usr/lib/siconv/cp850<br>
              recipe-sysroot-native/usr/lib/siconv/cp863<br>
              recipe-sysroot-native/usr/lib/siconv/cp865<br>
              recipe-sysroot-native/usr/lib/siconv/cp1255<br>
              recipe-sysroot-native/usr/lib/siconv/cp1256<br>
              recipe-sysroot-native/usr/lib/siconv/koi8-r<br>
              recipe-sysroot-native/usr/lib/siconv/cp1253<br>
              recipe-sysroot-native/usr/lib/siconv/cp862<br>
              recipe-sysroot-native/usr/lib/siconv/cp10079<br>
              recipe-sysroot-native/usr/lib/siconv/cp874<br>
              recipe-sysroot-native/usr/lib/siconv/cp1251<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-3<br>
              recipe-sysroot-native/usr/lib/libparanoia.a<br>
              recipe-sysroot-native/usr/lib/libdeflt.a<br>
              recipe-sysroot-native/usr/lib/profiled/<br>
              recipe-sysroot-native/usr/lib/profiled/libfind.a<br>
              recipe-sysroot-native/usr/lib/profiled/libschily.a<br>
              recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a<br>
              recipe-sysroot-native/usr/lib/profiled/libhfs.a<br>
              recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a<br>
              recipe-sysroot-native/usr/lib/profiled/libscg.a<br>
              recipe-sysroot-native/usr/lib/profiled/libfile.a<br>
              recipe-sysroot-native/usr/lib/profiled/libparanoia.a<br>
              recipe-sysroot-native/usr/lib/profiled/libdeflt.a<br>
              recipe-sysroot-native/usr/lib/profiled/libmdigest.a<br>
              recipe-sysroot-native/usr/lib/profiled/librscg.a<br>
              recipe-sysroot-native/usr/lib/profiled/libsiconv.a<br>
              recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a<br>
              recipe-sysroot-native/usr/lib/profiled/libscgcmd.a<br>
              recipe-sysroot-native/usr/lib/libmdigest.a<br>
              recipe-sysroot-native/usr/lib/librscg.a<br>
              recipe-sysroot-native/usr/lib/libsiconv.a<br>
              recipe-sysroot-native/usr/lib/libedc_ecc.a<br>
              recipe-sysroot-native/usr/lib/libscgcmd.a<br>
              recipe-sysroot-native/usr/include/<br>
              recipe-sysroot-native/usr/include/scg/<br>
              recipe-sysroot-native/usr/include/scg/scgio.h<br>
              recipe-sysroot-native/usr/include/scg/scsidefs.h<br>
              recipe-sysroot-native/usr/include/scg/scsicdb.h<br>
              recipe-sysroot-native/usr/include/scg/scgcmd.h<br>
              recipe-sysroot-native/usr/include/scg/scsireg.h<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10000: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp737: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-11:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp866: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp860: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-7:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-8:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp869: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-10:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1252: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp850: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp863: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp865: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1255: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1256: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/koi8-r: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1253: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp862: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10079: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp874: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1251: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-3:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libparanoia.a: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libdeflt.a: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libfind.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libschily.a:
              Cannot open: Permission denied<br>
              tar:
              recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libhfs.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libscg.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libfile.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libparanoia.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libdeflt.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libmdigest.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/librscg.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libsiconv.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libscgcmd.a:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libmdigest.a: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/librscg.a: Cannot open:
              Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libsiconv.a: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libedc_ecc.a: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/lib/libscgcmd.a: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/scg/scgio.h: Cannot
              open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/scg/scsidefs.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/scg/scsicdb.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/scg/scgcmd.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/scg/scsireg.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/scg/scsitransp.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/scsitransp.h<br>
              recipe-sysroot-native/usr/include/scg/srb_os2.h<br>
              recipe-sysroot-native/usr/include/scg/scgops.h<br>
              tar: recipe-sysroot-native/usr/include/scg/srb_os2.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/scg/scgops.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/aspi-win32.h<br>
              recipe-sysroot-native/usr/include/scg/spti-wnt.h<br>
              tar: recipe-sysroot-native/usr/include/scg/aspi-win32.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/scg/spti-wnt.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/aspi-dos.h<br>
              recipe-sysroot-native/usr/include/scg/scsisense.h<br>
              tar: recipe-sysroot-native/usr/include/scg/aspi-dos.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/scg/scsisense.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/<br>
              recipe-sysroot-native/usr/include/schily/checkerr.h<br>
              recipe-sysroot-native/usr/include/schily/locale.h<br>
              tar: recipe-sysroot-native/usr/include/schily/checkerr.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/locale.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/timeb.h<br>
              tar: recipe-sysroot-native/usr/include/schily/timeb.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/time.h<br>
              recipe-sysroot-native/usr/include/schily/stdint.h<br>
              tar: recipe-sysroot-native/usr/include/schily/time.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/stdint.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/inttypes.h<br>
              recipe-sysroot-native/usr/include/schily/io.h<br>
              tar: recipe-sysroot-native/usr/include/schily/inttypes.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/io.h: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/stdio.h<br>
              recipe-sysroot-native/usr/include/schily/siconv.h<br>
              tar: recipe-sysroot-native/usr/include/schily/stdio.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/siconv.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/deflts.h<br>
              recipe-sysroot-native/usr/include/schily/math.h<br>
              tar: recipe-sysroot-native/usr/include/schily/deflts.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/math.h:
              Cannot
              openrecipe-sysroot-native/usr/include/schily/schilyp.h<br>
              : Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/schilyp.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/systeminfo.h<br>
              recipe-sysroot-native/usr/include/schily/device.h<br>
              tar:
              recipe-sysroot-native/usr/include/schily/systeminfo.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/device.h:
              Cannot
              openrecipe-sysroot-native/usr/include/schily/limits.h<br>
              : Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/limits.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/alloca.h<br>
              tar: recipe-sysroot-native/usr/include/schily/alloca.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/ioctl.h<br>
              recipe-sysroot-native/usr/include/schily/maxpath.h<br>
              tar: recipe-sysroot-native/usr/include/schily/ioctl.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/maxpath.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/fnmatch.h<br>
              tar: recipe-sysroot-native/usr/include/schily/fnmatch.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/times.h<br>
              tar: recipe-sysroot-native/usr/include/schily/times.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/sem.h<br>
              recipe-sysroot-native/usr/include/schily/err_arch.h<br>
              tar: recipe-sysroot-native/usr/include/schily/sem.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/err_arch.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/signal.h<br>
              recipe-sysroot-native/usr/include/schily/standard.h<br>
              tar: recipe-sysroot-native/usr/include/schily/signal.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/standard.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/wchar.h<br>
              recipe-sysroot-native/usr/include/schily/in.h<br>
              tar: recipe-sysroot-native/usr/include/schily/wchar.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/in.h: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/libport.h<br>
              recipe-sysroot-native/usr/include/schily/avoffset.h<br>
              tar: recipe-sysroot-native/usr/include/schily/libport.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/avoffset.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/termcap.h<br>
              recipe-sysroot-native/usr/include/schily/rmtio.h<br>
              tar: recipe-sysroot-native/usr/include/schily/termcap.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/rmtio.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/assert.h<br>
              recipe-sysroot-native/usr/include/schily/xconfig.h<br>
              tar: recipe-sysroot-native/usr/include/schily/assert.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/xconfig.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/sigblk.h<br>
              tar: recipe-sysroot-native/usr/include/schily/sigblk.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/stat.h<br>
              recipe-sysroot-native/usr/include/schily/intcvt.h<br>
              tar: recipe-sysroot-native/usr/include/schily/stat.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/stkframe.h<br>
              tar: recipe-sysroot-native/usr/include/schily/intcvt.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/mman.h<br>
              recipe-sysroot-native/usr/include/schily/wctype.h<br>
              recipe-sysroot-native/usr/include/schily/dlfcn.h<br>
              recipe-sysroot-native/usr/include/schily/hostname.h<br>
              recipe-sysroot-native/usr/include/schily/wait.h<br>
              recipe-sysroot-native/usr/include/schily/rmd160.h<br>
              recipe-sysroot-native/usr/include/schily/walk.h<br>
              recipe-sysroot-native/usr/include/schily/varargs.h<br>
              recipe-sysroot-native/usr/include/schily/md5.h<br>
              recipe-sysroot-native/usr/include/schily/nlsdefs.h<br>
              recipe-sysroot-native/usr/include/schily/archdefs.h<br>
              recipe-sysroot-native/usr/include/schily/ctype.h<br>
              recipe-sysroot-native/usr/include/schily/pwd.h<br>
              recipe-sysroot-native/usr/include/schily/err_type.h<br>
              recipe-sysroot-native/usr/include/schily/inet.h<br>
              tar: recipe-sysroot-native/usr/include/schily/stkframe.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/mman.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/wctype.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/dlfcn.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/hostname.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/wait.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/rmd160.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/walk.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/varargs.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/md5.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/nlsdefs.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/archdefs.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/ctype.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/pwd.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/err_type.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/schily.h<br>
              recipe-sysroot-native/usr/include/schily/float.h<br>
              recipe-sysroot-native/usr/include/schily/patmatch.h<br>
              recipe-sysroot-native/usr/include/schily/netdb.h<br>
              recipe-sysroot-native/usr/include/schily/setjmp.h<br>
              recipe-sysroot-native/usr/include/schily/ipc.h<br>
              recipe-sysroot-native/usr/include/schily/libgen.h<br>
              recipe-sysroot-native/usr/include/schily/shadow.h<br>
              recipe-sysroot-native/usr/include/schily/types.h<br>
              recipe-sysroot-native/usr/include/schily/sysexits.h<br>
              recipe-sysroot-native/usr/include/schily/grp.h<br>
              recipe-sysroot-native/usr/include/schily/fstream.h<br>
              tar: recipe-sysroot-native/usr/include/schily/inet.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/schily.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/float.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/patmatch.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/netdb.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/setjmp.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/ipc.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/libgen.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/shadow.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/types.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/sysexits.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/grp.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/shm.h<br>
              recipe-sysroot-native/usr/include/schily/sunos4_proto.h<br>
              recipe-sysroot-native/usr/include/schily/err_char.h<br>
              recipe-sysroot-native/usr/include/schily/mtio.h<br>
              recipe-sysroot-native/usr/include/schily/librmt.h<br>
              recipe-sysroot-native/usr/include/schily/idcache.h<br>
              recipe-sysroot-native/usr/include/schily/_regex.h<br>
              recipe-sysroot-native/usr/include/schily/utime.h<br>
              recipe-sysroot-native/usr/include/schily/shedit.h<br>
              recipe-sysroot-native/usr/include/schily/string.h<br>
              recipe-sysroot-native/usr/include/schily/btorder.h<br>
              recipe-sysroot-native/usr/include/schily/md4.h<br>
              recipe-sysroot-native/usr/include/schily/prototyp.h<br>
              recipe-sysroot-native/usr/include/schily/mconfig.h<br>
              tar: recipe-sysroot-native/usr/include/schily/fstream.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/shm.h:
              Cannot open: Permission denied<br>
              tar:
              recipe-sysroot-native/usr/include/schily/sunos4_proto.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/err_char.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/mtio.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/librmt.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/idcache.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/_regex.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/utime.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/shedit.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/string.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/btorder.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/md4.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/prototyp.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/mconfig.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/find.h<br>
              recipe-sysroot-native/usr/include/schily/fetchdir.h<br>
              tar: recipe-sysroot-native/usr/include/schily/find.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/fetchdir.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/err_bit.h<br>
              recipe-sysroot-native/usr/include/schily/regex.h<br>
              tar: recipe-sysroot-native/usr/include/schily/err_bit.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/ccomdefs.h<br>
              tar: recipe-sysroot-native/usr/include/schily/regex.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/ccomdefs.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/resource.h<br>
              recipe-sysroot-native/usr/include/schily/sha2.h<br>
              tar: recipe-sysroot-native/usr/include/schily/resource.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/param.h<br>
              tar: recipe-sysroot-native/usr/include/schily/sha2.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/param.h:
              Cannot
              openrecipe-sysroot-native/usr/include/schily/fcntl.h<br>
              : Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/fcntl.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/sha1.h<br>
              recipe-sysroot-native/usr/include/schily/stdarg.h<br>
              tar: recipe-sysroot-native/usr/include/schily/sha1.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/stdarg.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/sigset.h<br>
              tar: recipe-sysroot-native/usr/include/schily/sigset.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/termios.h<br>
              tar: recipe-sysroot-native/usr/include/schily/termios.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/align.h<br>
              recipe-sysroot-native/usr/include/schily/errno.h<br>
              tar: recipe-sysroot-native/usr/include/schily/align.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/errno.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/socket.h<br>
              recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h<br>
              tar: recipe-sysroot-native/usr/include/schily/socket.h:
              Cannot open: Permission denied<br>
              tar:
              recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h:
              Cannot open: Permission denied<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h<br>
              tar:
              recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h:
              Cannot open: Permission denied<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h<br>
              tar:
              recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/unistd.h<br>
              recipe-sysroot-native/usr/include/schily/dirent.h<br>
              recipe-sysroot-native/usr/include/schily/select.h<br>
              recipe-sysroot-native/usr/include/schily/poll.h<br>
              recipe-sysroot-native/usr/include/schily/procfs.h<br>
              recipe-sysroot-native/usr/include/schily/stdlib.h<br>
              recipe-sysroot-native/usr/include/schily/getargs.h<br>
              recipe-sysroot-native/usr/include/schily/jmpdefs.h<br>
              recipe-sysroot-native/usr/include/schily/vfork.h<br>
              tar: recipe-sysroot-native/usr/include/schily/unistd.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/dirent.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/select.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/poll.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/procfs.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/stdlib.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/getargs.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/jmpdefs.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/vfork.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/windows.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/windows.h<br>
              recipe-sysroot-native/usr/include/schily/shcall.h<br>
              recipe-sysroot-native/usr/include/schily/utypes.h<br>
              tar: recipe-sysroot-native/usr/include/schily/shcall.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/xmconfig.h<br>
              tar: recipe-sysroot-native/usr/include/schily/utypes.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/xmconfig.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/utsname.h<br>
              recipe-sysroot-native/usr/include/schily/getcwd.h<br>
              tar: recipe-sysroot-native/usr/include/schily/utsname.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/getcwd.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/syslog.h<br>
              recipe-sysroot-native/usr/include/schily/priv.h<br>
              tar: recipe-sysroot-native/usr/include/schily/syslog.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/priv.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/iconv.h<br>
              recipe-sysroot-native/usr/include/schily/dbgmalloc.h<br>
              tar: recipe-sysroot-native/usr/include/schily/iconv.h:
              Cannot open: Permission denied<br>
              tar: recipe-sysroot-native/usr/include/schily/dbgmalloc.h:
              Cannot open: Permission denied<br>
              tar: Exiting with failure status due to previous errors<br>
              WARNING: exit code 2 from a shell command.<br>
              DEBUG: Python function do_populate_sysroot_setscene
              finishe<br>
              <br>
              Sure enough, if I manually try an extraction, I see the
              same issue:<br>
              <br>
              tar -I zstd --format=posix --acls --xattrs -xvpf
../sstate\:cdrtools-native\:x86_64-linux\:3.01\:r0\:x86_64\:11\:aa6350f6565599ed04df25250bb5415c0e2427b77569d94039f4e21820ee6aec_populate_sysroot.tar.zst<br>
              recipe-sysroot-native/<br>
              recipe-sysroot-native/sysroot-providers/<br>
              recipe-sysroot-native/sysroot-providers/cdrtools-native<br>
              recipe-sysroot-native/usr/<br>
              recipe-sysroot-native/usr/bin/<br>
              recipe-sysroot-native/usr/bin/cdda2ogg<br>
              recipe-sysroot-native/usr/bin/cdda2wav<br>
              recipe-sysroot-native/usr/bin/mkhybrid<br>
              recipe-sysroot-native/usr/bin/devdump<br>
              recipe-sysroot-native/usr/bin/isodebug<br>
              recipe-sysroot-native/usr/bin/scgskeleton<br>
              recipe-sysroot-native/usr/bin/btcflash<br>
              recipe-sysroot-native/usr/bin/cdrecord<br>
              recipe-sysroot-native/usr/bin/readcd<br>
              recipe-sysroot-native/usr/bin/isoinfo<br>
              recipe-sysroot-native/usr/bin/isodump<br>
              recipe-sysroot-native/usr/bin/cdda2mp3<br>
              recipe-sysroot-native/usr/bin/scgcheck<br>
              recipe-sysroot-native/usr/bin/mkisofs<br>
              recipe-sysroot-native/usr/bin/isovfy<br>
              recipe-sysroot-native/usr/sbin/<br>
              recipe-sysroot-native/usr/sbin/rscsi<br>
              recipe-sysroot-native/usr/share/<br>
              recipe-sysroot-native/usr/lib/<br>
              recipe-sysroot-native/usr/lib/libfind.a<br>
              tar: recipe-sysroot-native/usr/lib/libfind.a: Cannot open:
              Permission denied<br>
              recipe-sysroot-native/usr/lib/libschily.a<br>
              tar: recipe-sysroot-native/usr/lib/libschily.a: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/libedc_ecc_dec.a<br>
              tar: recipe-sysroot-native/usr/lib/libedc_ecc_dec.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/libhfs.a<br>
              tar: recipe-sysroot-native/usr/lib/libhfs.a: Cannot open:
              Permission denied<br>
              recipe-sysroot-native/usr/lib/libcdrdeflt.a<br>
              tar: recipe-sysroot-native/usr/lib/libcdrdeflt.a: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/libscg.a<br>
              tar: recipe-sysroot-native/usr/lib/libscg.a: Cannot open:
              Permission denied<br>
              recipe-sysroot-native/usr/lib/libfile.a<br>
              tar: recipe-sysroot-native/usr/lib/libfile.a: Cannot open:
              Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/<br>
              recipe-sysroot-native/usr/lib/siconv/cp10006<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10006: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-16<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-16:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-9<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-9:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp10007<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10007: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp10029<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10029: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-6<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-6:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-4<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-4:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp1257<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1257: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-13<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-13:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-2<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-2:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp437<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp437: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp775<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp775: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-15<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-15:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp857<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp857: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp1258<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1258: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp855<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp855: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp864<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp864: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-5<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-5:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp1254<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1254: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-1<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-1:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp861<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp861: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/koi8-u<br>
              tar: recipe-sysroot-native/usr/lib/siconv/koi8-u: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp10081<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10081: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-14<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-14:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp852<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp852: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp1250<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1250: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp10000<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10000: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp737<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp737: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-11<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-11:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp866<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp866: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp860<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp860: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-7<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-7:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-8<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-8:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp869<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp869: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-10<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-10:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp1252<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1252: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp850<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp850: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp863<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp863: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp865<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp865: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp1255<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1255: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp1256<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1256: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/koi8-r<br>
              tar: recipe-sysroot-native/usr/lib/siconv/koi8-r: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp1253<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1253: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp862<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp862: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp10079<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp10079: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp874<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp874: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/cp1251<br>
              tar: recipe-sysroot-native/usr/lib/siconv/cp1251: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/siconv/iso8859-3<br>
              tar: recipe-sysroot-native/usr/lib/siconv/iso8859-3:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/libparanoia.a<br>
              tar: recipe-sysroot-native/usr/lib/libparanoia.a: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/libdeflt.a<br>
              tar: recipe-sysroot-native/usr/lib/libdeflt.a: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/<br>
              recipe-sysroot-native/usr/lib/profiled/libfind.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libfind.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libschily.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libschily.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a<br>
              tar:
              recipe-sysroot-native/usr/lib/profiled/libedc_ecc_dec.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libhfs.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libhfs.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libcdrdeflt.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libscg.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libscg.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libfile.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libfile.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libparanoia.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libparanoia.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libdeflt.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libdeflt.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libmdigest.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libmdigest.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/librscg.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/librscg.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libsiconv.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libsiconv.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libedc_ecc.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/profiled/libscgcmd.a<br>
              tar: recipe-sysroot-native/usr/lib/profiled/libscgcmd.a:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/lib/libmdigest.a<br>
              tar: recipe-sysroot-native/usr/lib/libmdigest.a: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/librscg.a<br>
              tar: recipe-sysroot-native/usr/lib/librscg.a: Cannot open:
              Permission denied<br>
              recipe-sysroot-native/usr/lib/libsiconv.a<br>
              tar: recipe-sysroot-native/usr/lib/libsiconv.a: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/libedc_ecc.a<br>
              tar: recipe-sysroot-native/usr/lib/libedc_ecc.a: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/lib/libscgcmd.a<br>
              tar: recipe-sysroot-native/usr/lib/libscgcmd.a: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/include/<br>
              recipe-sysroot-native/usr/include/scg/<br>
              recipe-sysroot-native/usr/include/scg/scgio.h<br>
              tar: recipe-sysroot-native/usr/include/scg/scgio.h: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/scsidefs.h<br>
              tar: recipe-sysroot-native/usr/include/scg/scsidefs.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/scsicdb.h<br>
              tar: recipe-sysroot-native/usr/include/scg/scsicdb.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/scgcmd.h<br>
              tar: recipe-sysroot-native/usr/include/scg/scgcmd.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/scsireg.h<br>
              tar: recipe-sysroot-native/usr/include/scg/scsireg.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/scsitransp.h<br>
              tar: recipe-sysroot-native/usr/include/scg/scsitransp.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/srb_os2.h<br>
              tar: recipe-sysroot-native/usr/include/scg/srb_os2.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/scgops.h<br>
              tar: recipe-sysroot-native/usr/include/scg/scgops.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/aspi-win32.h<br>
              tar: recipe-sysroot-native/usr/include/scg/aspi-win32.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/spti-wnt.h<br>
              tar: recipe-sysroot-native/usr/include/scg/spti-wnt.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/aspi-dos.h<br>
              tar: recipe-sysroot-native/usr/include/scg/aspi-dos.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/scg/scsisense.h<br>
              tar: recipe-sysroot-native/usr/include/scg/scsisense.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/<br>
              recipe-sysroot-native/usr/include/schily/checkerr.h<br>
              tar: recipe-sysroot-native/usr/include/schily/checkerr.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/locale.h<br>
              tar: recipe-sysroot-native/usr/include/schily/locale.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/timeb.h<br>
              tar: recipe-sysroot-native/usr/include/schily/timeb.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/time.h<br>
              tar: recipe-sysroot-native/usr/include/schily/time.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/stdint.h<br>
              tar: recipe-sysroot-native/usr/include/schily/stdint.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/inttypes.h<br>
              tar: recipe-sysroot-native/usr/include/schily/inttypes.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/io.h<br>
              tar: recipe-sysroot-native/usr/include/schily/io.h: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/stdio.h<br>
              tar: recipe-sysroot-native/usr/include/schily/stdio.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/siconv.h<br>
              tar: recipe-sysroot-native/usr/include/schily/siconv.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/deflts.h<br>
              tar: recipe-sysroot-native/usr/include/schily/deflts.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/math.h<br>
              tar: recipe-sysroot-native/usr/include/schily/math.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/schilyp.h<br>
              tar: recipe-sysroot-native/usr/include/schily/schilyp.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/systeminfo.h<br>
              tar:
              recipe-sysroot-native/usr/include/schily/systeminfo.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/device.h<br>
              tar: recipe-sysroot-native/usr/include/schily/device.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/limits.h<br>
              tar: recipe-sysroot-native/usr/include/schily/limits.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/alloca.h<br>
              tar: recipe-sysroot-native/usr/include/schily/alloca.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/ioctl.h<br>
              tar: recipe-sysroot-native/usr/include/schily/ioctl.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/maxpath.h<br>
              tar: recipe-sysroot-native/usr/include/schily/maxpath.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/fnmatch.h<br>
              tar: recipe-sysroot-native/usr/include/schily/fnmatch.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/times.h<br>
              tar: recipe-sysroot-native/usr/include/schily/times.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/sem.h<br>
              tar: recipe-sysroot-native/usr/include/schily/sem.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/err_arch.h<br>
              tar: recipe-sysroot-native/usr/include/schily/err_arch.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/signal.h<br>
              tar: recipe-sysroot-native/usr/include/schily/signal.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/standard.h<br>
              tar: recipe-sysroot-native/usr/include/schily/standard.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/wchar.h<br>
              tar: recipe-sysroot-native/usr/include/schily/wchar.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/in.h<br>
              tar: recipe-sysroot-native/usr/include/schily/in.h: Cannot
              open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/libport.h<br>
              tar: recipe-sysroot-native/usr/include/schily/libport.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/avoffset.h<br>
              tar: recipe-sysroot-native/usr/include/schily/avoffset.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/termcap.h<br>
              tar: recipe-sysroot-native/usr/include/schily/termcap.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/rmtio.h<br>
              tar: recipe-sysroot-native/usr/include/schily/rmtio.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/assert.h<br>
              tar: recipe-sysroot-native/usr/include/schily/assert.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/xconfig.h<br>
              tar: recipe-sysroot-native/usr/include/schily/xconfig.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/sigblk.h<br>
              tar: recipe-sysroot-native/usr/include/schily/sigblk.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/stat.h<br>
              tar: recipe-sysroot-native/usr/include/schily/stat.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/intcvt.h<br>
              tar: recipe-sysroot-native/usr/include/schily/intcvt.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/stkframe.h<br>
              tar: recipe-sysroot-native/usr/include/schily/stkframe.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/mman.h<br>
              tar: recipe-sysroot-native/usr/include/schily/mman.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/wctype.h<br>
              tar: recipe-sysroot-native/usr/include/schily/wctype.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/dlfcn.h<br>
              tar: recipe-sysroot-native/usr/include/schily/dlfcn.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/hostname.h<br>
              tar: recipe-sysroot-native/usr/include/schily/hostname.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/wait.h<br>
              tar: recipe-sysroot-native/usr/include/schily/wait.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/rmd160.h<br>
              tar: recipe-sysroot-native/usr/include/schily/rmd160.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/walk.h<br>
              tar: recipe-sysroot-native/usr/include/schily/walk.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/varargs.h<br>
              tar: recipe-sysroot-native/usr/include/schily/varargs.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/md5.h<br>
              tar: recipe-sysroot-native/usr/include/schily/md5.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/nlsdefs.h<br>
              tar: recipe-sysroot-native/usr/include/schily/nlsdefs.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/archdefs.h<br>
              tar: recipe-sysroot-native/usr/include/schily/archdefs.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/ctype.h<br>
              tar: recipe-sysroot-native/usr/include/schily/ctype.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/pwd.h<br>
              tar: recipe-sysroot-native/usr/include/schily/pwd.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/err_type.h<br>
              tar: recipe-sysroot-native/usr/include/schily/err_type.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/inet.h<br>
              tar: recipe-sysroot-native/usr/include/schily/inet.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/schily.h<br>
              tar: recipe-sysroot-native/usr/include/schily/schily.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/float.h<br>
              tar: recipe-sysroot-native/usr/include/schily/float.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/patmatch.h<br>
              tar: recipe-sysroot-native/usr/include/schily/patmatch.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/netdb.h<br>
              tar: recipe-sysroot-native/usr/include/schily/netdb.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/setjmp.h<br>
              tar: recipe-sysroot-native/usr/include/schily/setjmp.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/ipc.h<br>
              tar: recipe-sysroot-native/usr/include/schily/ipc.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/libgen.h<br>
              tar: recipe-sysroot-native/usr/include/schily/libgen.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/shadow.h<br>
              tar: recipe-sysroot-native/usr/include/schily/shadow.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/types.h<br>
              tar: recipe-sysroot-native/usr/include/schily/types.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/sysexits.h<br>
              tar: recipe-sysroot-native/usr/include/schily/sysexits.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/grp.h<br>
              tar: recipe-sysroot-native/usr/include/schily/grp.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/fstream.h<br>
              tar: recipe-sysroot-native/usr/include/schily/fstream.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/shm.h<br>
              tar: recipe-sysroot-native/usr/include/schily/shm.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/sunos4_proto.h<br>
              tar:
              recipe-sysroot-native/usr/include/schily/sunos4_proto.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/err_char.h<br>
              tar: recipe-sysroot-native/usr/include/schily/err_char.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/mtio.h<br>
              tar: recipe-sysroot-native/usr/include/schily/mtio.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/librmt.h<br>
              tar: recipe-sysroot-native/usr/include/schily/librmt.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/idcache.h<br>
              tar: recipe-sysroot-native/usr/include/schily/idcache.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/_regex.h<br>
              tar: recipe-sysroot-native/usr/include/schily/_regex.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/utime.h<br>
              tar: recipe-sysroot-native/usr/include/schily/utime.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/shedit.h<br>
              tar: recipe-sysroot-native/usr/include/schily/shedit.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/string.h<br>
              tar: recipe-sysroot-native/usr/include/schily/string.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/btorder.h<br>
              tar: recipe-sysroot-native/usr/include/schily/btorder.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/md4.h<br>
              tar: recipe-sysroot-native/usr/include/schily/md4.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/prototyp.h<br>
              tar: recipe-sysroot-native/usr/include/schily/prototyp.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/mconfig.h<br>
              tar: recipe-sysroot-native/usr/include/schily/mconfig.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/find.h<br>
              tar: recipe-sysroot-native/usr/include/schily/find.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/fetchdir.h<br>
              tar: recipe-sysroot-native/usr/include/schily/fetchdir.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/err_bit.h<br>
              tar: recipe-sysroot-native/usr/include/schily/err_bit.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/regex.h<br>
              tar: recipe-sysroot-native/usr/include/schily/regex.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/ccomdefs.h<br>
              tar: recipe-sysroot-native/usr/include/schily/ccomdefs.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/resource.h<br>
              tar: recipe-sysroot-native/usr/include/schily/resource.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/sha2.h<br>
              tar: recipe-sysroot-native/usr/include/schily/sha2.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/param.h<br>
              tar: recipe-sysroot-native/usr/include/schily/param.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/fcntl.h<br>
              tar: recipe-sysroot-native/usr/include/schily/fcntl.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/sha1.h<br>
              tar: recipe-sysroot-native/usr/include/schily/sha1.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/stdarg.h<br>
              tar: recipe-sysroot-native/usr/include/schily/stdarg.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/sigset.h<br>
              tar: recipe-sysroot-native/usr/include/schily/sigset.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/termios.h<br>
              tar: recipe-sysroot-native/usr/include/schily/termios.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/align.h<br>
              tar: recipe-sysroot-native/usr/include/schily/align.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/errno.h<br>
              tar: recipe-sysroot-native/usr/include/schily/errno.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/socket.h<br>
              tar: recipe-sysroot-native/usr/include/schily/socket.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h<br>
              tar:
              recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/avoffset.h:
              Cannot open: Permission denied<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h<br>
              tar:
              recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/xconfig.h:
              Cannot open: Permission denied<br>
recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h<br>
              tar:
              recipe-sysroot-native/usr/include/schily/x86_64-linux-gcc/align.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/unistd.h<br>
              tar: recipe-sysroot-native/usr/include/schily/unistd.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/dirent.h<br>
              tar: recipe-sysroot-native/usr/include/schily/dirent.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/select.h<br>
              tar: recipe-sysroot-native/usr/include/schily/select.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/poll.h<br>
              tar: recipe-sysroot-native/usr/include/schily/poll.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/procfs.h<br>
              tar: recipe-sysroot-native/usr/include/schily/procfs.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/stdlib.h<br>
              tar: recipe-sysroot-native/usr/include/schily/stdlib.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/getargs.h<br>
              tar: recipe-sysroot-native/usr/include/schily/getargs.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/jmpdefs.h<br>
              tar: recipe-sysroot-native/usr/include/schily/jmpdefs.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/vfork.h<br>
              tar: recipe-sysroot-native/usr/include/schily/vfork.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/windows.h<br>
              tar: recipe-sysroot-native/usr/include/schily/windows.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/shcall.h<br>
              tar: recipe-sysroot-native/usr/include/schily/shcall.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/utypes.h<br>
              tar: recipe-sysroot-native/usr/include/schily/utypes.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/xmconfig.h<br>
              tar: recipe-sysroot-native/usr/include/schily/xmconfig.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/utsname.h<br>
              tar: recipe-sysroot-native/usr/include/schily/utsname.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/getcwd.h<br>
              tar: recipe-sysroot-native/usr/include/schily/getcwd.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/syslog.h<br>
              tar: recipe-sysroot-native/usr/include/schily/syslog.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/priv.h<br>
              tar: recipe-sysroot-native/usr/include/schily/priv.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/iconv.h<br>
              tar: recipe-sysroot-native/usr/include/schily/iconv.h:
              Cannot open: Permission denied<br>
              recipe-sysroot-native/usr/include/schily/dbgmalloc.h<br>
              tar: recipe-sysroot-native/usr/include/schily/dbgmalloc.h:
              Cannot open: Permission denied<br>
              tar: Exiting with failure status due to previous errors<br>
              <br>
              The files in question are readonly so it looks like it
              creates the file<br>
              readonly and then can't write the xattr data to it. If I
              drop the --<br>
              xattrs parameter to tar, it works.<br>
              <br>
              The version of tar in question is:<br>
              <br>
              pokybuild@debian11-ty-1:~/yocto-worker/wic/build/1$ tar
              --version<br>
              tar (GNU tar) 1.34<br>
              Copyright (C) 2021 Free Software Foundation, Inc.<br>
              License GPLv3+: GNU GPL version 3 or later &lt;<a href="https://gnu.org/licenses/gpl.html" originalsrc="https://gnu.org/licenses/gpl.html" shash="XSH6zDH4J7uegxDMVn+QyF6NB+xYWFcvkbh8+3bf7m5NfUzi452Uxoy+6pH9a5ikV36kIEFEdMk/MZtglyYNA7kt1rsSIzwmfZIdKOacsPPOCzrLVRA0gjoFtHFED1BrId8DJzjV79YRj8aHtWGXZZAmOF0gF/gyC4R9F+Yc4Bc=" moz-do-not-send="true">https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgnu.org%2Flicenses%2Fgpl.html&amp;data=05%7C01%7Cp.lobacz%40welotec.com%7Cf02568261c5849e1dac308dba470e7ce%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638284577345843928%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=xtkH9eIwpUJYO9WnFoTkQG2PLRjjPts0JAEkVq81%2BRI%3D&amp;reserved=0</a>&gt;.<br>
              This is free software: you are free to change and
              redistribute it.<br>
              There is NO WARRANTY, to the extent permitted by law.<br>
              <br>
              Written by John Gilmore and Jay Fenlason.<br>
              <br>
              <br>
              Cheers,<br>
              <br>
              Richard<br>
              <br>
              <br>
              <br>
            </div>
          </span></font></div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#186819): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/186819">https://lists.openembedded.org/g/openembedded-core/message/186819</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/101006112/7527613">https://lists.openembedded.org/mt/101006112/7527613</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:p.lobacz@welotec.com">p.lobacz@welotec.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------22ifhH0VXpUptkwIn0nyt0Lw--

