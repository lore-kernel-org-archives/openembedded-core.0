Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A495C8302D
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:02:27 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.15])
 by mx.groups.io with SMTP id smtpd.web10.35128.1751274144941876550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=lk7s4usw;
 spf=pass (domain: prevas.dk, ip: 40.107.130.15, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYhNOhkYcUBK8sJv5hjtSbmPNBEifkiDq77w3c+/JU7XFDWkFHJcuaCJrdXCDKrGs3YLhfZ1opOE+l9JTak23vUAjg4XQbkhefBQQ4LEFro++SjLim+SEOVO8Ea3zk6rNbrC7BJeJKL8l5zMWoEsmcDB+srrxi2dHilqkSG9S9ZYUjh1ziSOKpyVV/s1WUjFPBdYl22IaIXKM50/WIgmzziGLDhvLnflttkzCHr7B8oJIbBEufbOYnuWxFnMA76Gu+N/MO5oqVNo+GRBX2Zm8Yqa1h22Vh6ZIanIC1dvySOUUctj503bRXkdsucnfFNvIJtBcI0f2ofPAt3zKa9lJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCY2SG1kQ5npeHO7HkhPNf+ZzliS7ONB0sdV4+KuWYE=;
 b=WA9mDD9Yi1nnVzARVND6ipw3yyO6cUNS1WMDvj+N2pYG7d5sF9FIopH+PFcNywiL/31ImN2lOYYR3cH0Y+eSjjuVEvCreFxB5My5gnB08827lZf5cOPjX2s7sPRtptmvRL4YG+NV0ya1uE7UVleVLRQn+wOLJVIM9kkntYWbh/c4LV6k06IyiGypHYWWhcKpoGTHLXb8ucYv1HPwXalgHozVhKv99rbSqStIwW8v0g3y1ArQa1CfYeaNqPEWBenBni9J79SzKgxAjSetwXvdFhlIuW9txvpWgkbUjGUMpECCS6nG0Q6RRwnC9sPp/OuafBnywMIjVbXZDfiFLRN/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCY2SG1kQ5npeHO7HkhPNf+ZzliS7ONB0sdV4+KuWYE=;
 b=lk7s4uswiVBW+ZxA/HxOHrpwsknTMmo5tCOf9ty4WCQ3jv71MuSt/tM0QgjpHI3uu7l5LzymfOb0imNwpuwm1Xbl40XTVI3266aeB7vlxO9PkMAJiPfxYjtZh6YZhA8GOG0rzXHAYGBWR5ctEYmMfBb5A1x7XZC2StxYEn5SNA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by PAVPR10MB7308.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 09:02:16 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%5]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 09:02:16 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf/sstate: Introduce
 DEFAULT_SHARED_UMASK to standarise shared area umask
In-Reply-To: <20250627212423.3315152-1-richard.purdie@linuxfoundation.org>
	(Richard Purdie via lists openembedded org's message of "Fri, 27 Jun
	2025 22:24:22 +0100")
References: <20250627212423.3315152-1-richard.purdie@linuxfoundation.org>
Date: Mon, 30 Jun 2025 11:02:16 +0200
Message-ID: <87ecv1y547.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0028.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:a::8)
 To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|PAVPR10MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c00069d-fd4b-4694-bd45-08ddb7b4cfd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MJm48mVyDSShSSUptsDMrOQBy6kDutaC/WF24XEJa5PPd5VK3jVlVX1xzB5G?=
 =?us-ascii?Q?gjrpEBJy55erFY5CLP5DifPe2Qw0+QjvonLvFAyWsHS/vUrifQ/sXotQdfZp?=
 =?us-ascii?Q?KRcsA7J+fs2+ZL94q3futSPgct8Ql/I8G1yrvUEB3rkuVHYfNMpQHWK7SeeW?=
 =?us-ascii?Q?Lp3IlfdzbUv5VuGbL4Ca3dh069y+KiJUi9P6imEFmhLM0q/8YBIiJOoprV2/?=
 =?us-ascii?Q?3lzPiScE8CniMO1zwhJnW0etURV6/frqorr90Sr+FpELmYJ2HwzeHL2fl/fs?=
 =?us-ascii?Q?EJlN38hXPPS/66MhyqA6n4euFa4UI8ZRC/vaazrhTEuvykT2zjr4RvTDhyE7?=
 =?us-ascii?Q?VIhKWDxgaNGM/r+8uMd26EgOG8vMawZcD+g7qAlfJDc4+SQtWIt8qNA64w6A?=
 =?us-ascii?Q?a6rwSbCGnCUrf3OrwWavd3wbFotnFlSDsmwZ2PU/cAlALr+XRpu462z1BQDt?=
 =?us-ascii?Q?r7PGIQzvk9CKlgXDxVpl5XJhN617en+QOucnx3FK0+8X9i14tmxMAtvfvJMJ?=
 =?us-ascii?Q?nRFnCI1AVCxduV1Ug7NZt81VfC8Tww1KLXWNz+XZDXWfv4xQljR6ZF9T3X7M?=
 =?us-ascii?Q?IbhJ3o1iIR3EE9EYH9vAdLMtGiSS1TCSFvi7KyyJL0HyvjOqSSyvZCYETCfL?=
 =?us-ascii?Q?CNjlODX8J5jClK6x7iQB0J4KUMKDCOosA1uF6TFN3rf9CR56LfhZzmbCrd9A?=
 =?us-ascii?Q?TDPOFrwAGuITGcerzo9xMghSbxHah2nMiXiB2DgrQd/OSf9uhoHymY5G+ghy?=
 =?us-ascii?Q?vyO5lhk38dGLqTvk/+QfrRh41/YjblnDqV8AmLjBRPEd2g3afxW/iWVcjLhN?=
 =?us-ascii?Q?Y9XIV90PKTVbxqJHBrDPNfovgtGFN0Q+iB2OzLq4gHuaK8l4oHrnNJ+chkNa?=
 =?us-ascii?Q?9ANu4Ox7HiGc7cmRg/46aAcnyMVnFZqxfJV7bIRzLfRWfTXd5m17bKZxI51g?=
 =?us-ascii?Q?YniAKX1uJs1tEuhmStOyOqR05lDHhqCFVC1EF6sChO1feQhRzebo1NDfmyNp?=
 =?us-ascii?Q?P3NK1Xi68P3JGpdk45sT6mZbQUvv4pk0YOhvFKFyZjlwNnnGpBlIspkEKXw3?=
 =?us-ascii?Q?63pPygvxGZtGFznrdS+sdHK5PmDBGdHcOEpP2kbvECopfyvWoTlOn6lXQJUA?=
 =?us-ascii?Q?2pp+Y+rpE6xIFOMLAKj5PT5Y8Rz+z/3V091f4LQALn7ViE+HV4GolebOKQLI?=
 =?us-ascii?Q?2N7ocX6Gvp837cBRmIP/4trQOCXGgRVj0y9mKMoDQgyUaRZlIw41b2AvTTMP?=
 =?us-ascii?Q?kLJBbtmH4iyks7LqojaQMITOc2Dblq+Q0EsJglhhLShcGvj6tXSm0+xRCIIA?=
 =?us-ascii?Q?n7P9pAtec6YtphJrnYAa1AQjmX/oKFpUWEJ7BR22A/l+xtpYj3La5jLQOYN1?=
 =?us-ascii?Q?l6cNhYxSCY4MKPdQgx1tSJfPY95gdPQziTWEIDsGV2sUPgoi1qQ2H1THVLqo?=
 =?us-ascii?Q?7m2cQj6yWyU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LyUB7LiyvBevOtA9y1dUrfc++ifBJ3aPgfwSn2oUgEUB0AhKKp29XAZrRfoU?=
 =?us-ascii?Q?M2q8dIj5wN1jRZUljsJEfjrNOhdmVSqGgrbvZoboLn+PQ/ZALIiGq5aojajJ?=
 =?us-ascii?Q?XYgBton0k/oCRsgaW29ahU9ExN394Ss2HK3dUxdWDGON6IvwvvYlJG1KEisK?=
 =?us-ascii?Q?26VggO7Bjcq460c/vjgfj/lSriHoJsWtzHpFTC93Xwm8SrcEUppZJZhho8F2?=
 =?us-ascii?Q?p9/xB4j/ise5BKdl5/x7NcfTWcN4AkJwTUyt7MZqInRoSXp13B1pHcePbusP?=
 =?us-ascii?Q?R6lIT5Q6K7zGxLMmLEDTExdMC7mPvRzMonYSECfj8ZnlHy7WyQyvcU+lV/eZ?=
 =?us-ascii?Q?G34+f9t73Un0wih5mfA6oRUV/8yl7bdEwt4kDmLyhXcMi7uORVm2grsIsDQr?=
 =?us-ascii?Q?iMP7gEaTk78BW6Ehbx52fHDREfEPSUhFbKbDja8tUjLGxiQDaYGh0jopIYrD?=
 =?us-ascii?Q?25C0onArAiqW5p8egTeucRxkgglhlFOGLLRGyZb27aSZn4wfHsuYGJtLNMeJ?=
 =?us-ascii?Q?dJVQTik4Xbzs77n9QnxJDTAkmwEfX7nKWXka+miTu8NrEFwUaNY3qmI+BTX8?=
 =?us-ascii?Q?rlFHv1nf5Z8azvs0+M0E0HcP2b5iHFtcWgy46HX58GOc0H0NOBgWiry3K5WV?=
 =?us-ascii?Q?zIVFooj3aJbLQbcTMM5xBSjXBksxOs6ey6Z6Y/ZSNIMZXfbNJkfNiVTLt01q?=
 =?us-ascii?Q?w+xkLbEyYf75q4+t66eNm7/h5srKPC6OLUJ0PygnV99epB3XqNxv/ZUnsyh+?=
 =?us-ascii?Q?DqJlkpZD9/aECNlxU/k/CgIHi4umgm4Y3tGXhXc6QW/0zmucDT2ILgBrVs0n?=
 =?us-ascii?Q?lAlhXhB6Wqb+ZxujWVxFHMHNk2dvqWkCLulKOS1UeaNe81EfPSTKPGuH/iUE?=
 =?us-ascii?Q?SvcGBGF8494zOk9uGQjSO9yKxlz5LEgQrPxISG5Y/uLNBxjNVPYmk7dOfEbv?=
 =?us-ascii?Q?3ybwVhkSrSb3yYiPZfIq61DMqmjsi6wgEJQDNdko7L7WZdaxGLXg85eJkcz2?=
 =?us-ascii?Q?HQO/olT07G36aaYtNCHtV82dmtbf365LcRBaqcc48HYrtUMC5P7Xdx0XK8ZU?=
 =?us-ascii?Q?8DKmvCDBhzmwU3LIboRmoT8PZVMD4dWm+X7YB3Jq6MQ9BbC5sjFYORs0alVC?=
 =?us-ascii?Q?V4yzS3nm/el1fa0qoNz1MMwceD083/i9BeVWAs9Mf/1XqLFfjGnt1GOuXMh7?=
 =?us-ascii?Q?tInCZuun0eSna0JSSXqzIZfQc50l8XYQR2aFsoqMrkdtx1RsBIu7t1vJ10a+?=
 =?us-ascii?Q?ABBn6qeG8ucLAwRczbGoLhlvbz6jh9IZ2JXATf1AqnIPrhHgEkXFGdav2WMa?=
 =?us-ascii?Q?9EHFKwZegeEzVKflzoAksbgwwOZs/ITvqp9aawahfBmxr3kwAqdKOYcDcvg6?=
 =?us-ascii?Q?DMKz1MtN08Y5nFfy28rs1tAJQrTA8wyYWEaMyS3sYHRgTMhnPWqkkUl+VBD4?=
 =?us-ascii?Q?jvLrFXtm0OPBt9tsZQac4mwZk4Z0xfs3yVsy3Hoje1IJXk1JCy6WmMYb5hsZ?=
 =?us-ascii?Q?56M3Ut2zyr5BDpPaG7srfRmNXHV8m9kSGzeYIMZ+ECKmE1sSnKdv/XRACQtI?=
 =?us-ascii?Q?FP8YQ8UyaYot4im5EHRj2qvHBRZGTHbo/ZMqqlx2K4g8B762CciENzdg6GRY?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c00069d-fd4b-4694-bd45-08ddb7b4cfd4
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 09:02:16.6424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYdUvJCGbLQ3aSUYfFCGlIvn633jUcPEInoBzFFWLj6HYd5sSu98PIC/qYfHqYRbcdY67qc4O+M+Me7hj4EjN4oQM1IFbLalkJ+JETOW70Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7308
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219460

On Fri, Jun 27 2025, "Richard Purdie via lists.openembedded.org" <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:

> Currently, the "shared" directory permissions of sstate are hardcoded. Since
> multiple areas of the code reference this, separate it out to a variable to
> allow the behaviour to be configurable. Initially this applies to SSTATE_DIR.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/sstate.bbclass | 12 +++++++-----
>  meta/conf/bitbake.conf             |  2 ++
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
> index 2968cc4c2e7..7578aad24ea 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -745,7 +745,7 @@ def pstaging_fetch(sstatefetch, d):
>      if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
>          uris += ['file://{0}.sig;downloadfilename={0}.sig'.format(sstatefetch)]
>  
> -    with bb.utils.umask(0o002):
> +    with bb.utils.umask(bb.utils.to_filemode(d.getVar("DEFAULT_SHARED_UMASK"))):
>          bb.utils.mkdirhier(dldir)
>  
>          for srcuri in uris:
> @@ -776,9 +776,10 @@ sstate_task_prefunc[dirs] = "${WORKDIR}"
>  python sstate_task_postfunc () {
>      shared_state = sstate_state_fromvars(d)
>  
> -    omask = os.umask(0o002)
> -    if omask != 0o002:
> -       bb.note("Using umask 0o002 (not %0o) for sstate packaging" % omask)
> +    shared_umask = bb.utils.to_filemode(d.getVar("DEFAULT_SHARED_UMASK"))
> +    omask = os.umask(shared_umask)
> +    if omask != shared_umask:
> +       bb.note("Using umask %0o (not %0o) for sstate packaging" % (shared_umask, omask))
>      sstate_package(shared_state, d)
>      os.umask(omask)
>  
> @@ -843,7 +844,8 @@ python sstate_create_and_sign_package () {
>  
>      # Create the required sstate directory if it is not present.
>      if not sstate_pkg.parent.is_dir():
> -        with bb.utils.umask(0o002):
> +        shared_umask = bb.utils.to_filemode(d.getVar("DEFAULT_SHARED_UMASK"))
> +        with bb.utils.umask(shared_umask):
>              bb.utils.mkdirhier(str(sstate_pkg.parent))
>  
>      if sign_pkg:
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a3300fc1727..22473bfe23a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -944,6 +944,8 @@ TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH').replace("_", "-")}"
>  
>  # Set a default umask to use for tasks for determinism
>  BB_DEFAULT_UMASK ??= "022"
> +# The umask to use for shared files (e.g. DL_DIR and SSTATE_DIR)
> +DEFAULT_SHARED_UMASK ??= "002"

This is perhaps bikeshedding, but I think that naming is somewhat
off. For BB_DEFAULT_UMASK, the "default" refers to this being used if
the task doesn't have it's own [umask] flag.

For the new variable, yes, this setting is a default, but that's really
the ??= part of the line. If someone wants to change the umask used for
those 'shared' areas, they should just have to change
"SHARED_UMASK". Otherwise we should also have DEFAULT_PARALLEL_MAKE etc.

I think I'd prefer a BB_ prefix, just to keep it a little namespaced,
but I can see how this might not be a bitbake thing (unlike the variable
that applies to tasks in general).

Should the 0775 instances in the test code be updated to be computed
as 0777 minus [DEFAULT_]SHARED_UMASK or is it assumed that the tests
are always run with default settings?

Rasmus

