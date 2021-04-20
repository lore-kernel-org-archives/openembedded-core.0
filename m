Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.76])
 by mx.groups.io with SMTP id smtpd.web08.940.1618939420988129837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 10:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pPlSwX3J;
 spf=pass (domain: windriver.com, ip: 40.107.243.76, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYbHxe3GXHGJw52bU+pN5Z3RH3kj2iIfifyi/U3nwNfXU/VhhimXFCN/6PKoPy0ERC+XktTwsTPJq+0roPYJIIJsl/RT+0Pb1l4rcnjIH3G9aZapClaMugIDMpjn2xpID7vgwBLEB9a575aBghD2n7jypVh2ainkM0e3d6bKSu2V1SDapyc3S7CsygMxQeF9zjsI6y4LBiKuARiiqxpx9yAWcyLHq+G1OdHTMgc2vGX7uU24UKnBhQuJ2xcQrjW4ra+3qnuvQqwD0lJHcRptpo+4+VVU27uJfIN94q6P+5Pkc1EgnLTnrEgzIQUGkkjSdpvaHTD06p7tn5R0q817sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ld80DCS+R00bpyTOYjDECZoB+AaDy4H1cG+NnKPlXVw=;
 b=XLt4cegCTbBPuKMHSfTJsEH+9mlzwfQ600HSmE11OgTQZTsW3Uei/jHWQgpYEJnMzyq1OKFYmFGUE9sD8hVpvUKudqmtEYhUfJ6zav9/tPqEHxloqr/7rgEad8uM+3zEqMMeYl2j14DDj+ZzXSWJpVACSmrpchbU0daiA5dWf0NFyrJhUxYCPn9Ij329Ns4a+uegSylL1WT5fgdk+zEJa49nwvrYSXXzRWHlgbdgIFfQwZ1pBXRhgWEm13HqocYnjm9DQT3a6WoIN9zP85nMGekA8evLhcpsd2l9ETkTLA2shlAV8m3w1CG9VPCC7tkNR2cXI/+yoeXPApddadF+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ld80DCS+R00bpyTOYjDECZoB+AaDy4H1cG+NnKPlXVw=;
 b=pPlSwX3JYa86ldkYZSLPLoruLr4VQh05kmrvIZwySBEzxusKOI+isXDbR9oVqX6zhmGd3A+W9MY0Dt8hRTs3NEP8vQuodeZU6rlVeQ5G0sn23+hmV3Yu1vT21d0d8nIToWo/APwYq/K8cFHeZZLS0tuWOxVH9+p8vruU181L1nE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3998.namprd11.prod.outlook.com (2603:10b6:208:137::21)
 by MN2PR11MB3822.namprd11.prod.outlook.com (2603:10b6:208:f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Tue, 20 Apr
 2021 17:23:38 +0000
Received: from MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::84ae:90a0:3422:acfe]) by MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::84ae:90a0:3422:acfe%4]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 17:23:38 +0000
Subject: Re: [yocto-security] [PATCH] busybox: use openssl for TLS connections whenever possible
To: Shachar Menashe <shachar@vdoo.com>,
 yocto-security@lists.yoctoproject.org,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <mMlg.1618670463873919193.89er@lists.yoctoproject.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <c80d4ed8-13a1-94a7-9a26-6b4183e89940@windriver.com>
Date: Tue, 20 Apr 2021 13:23:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <mMlg.1618670463873919193.89er@lists.yoctoproject.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR11CA0088.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::29) To MN2PR11MB3998.namprd11.prod.outlook.com
 (2603:10b6:208:137::21)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR11CA0088.namprd11.prod.outlook.com (2603:10b6:a03:f4::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 17:23:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 060d9c24-c91d-4b3a-ce3c-08d904210897
X-MS-TrafficTypeDiagnostic: MN2PR11MB3822:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB382216E07C915DD189F7929FF8489@MN2PR11MB3822.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c6jXZvbYckR+WZIHBrMkwbZbtb8kCSmztjhmSD4pfcWUP//ymeYkAbBAwbtQHML03syx83hO6gcGHVqal0qvgEroFqY5aOfG/CZHMS9e4AmyqVrR9wmGAx4IQBxXPa//03WsTTzL/ZESvYuiOCRdJf4zhayUXdGbP4lMTWZfy+waGKeFUSqrQ1A4Cx6wo9pxDf/X2mXx9pTHIdz/9avGnk0Re+tgVn14Yhh7SfNW2BQGK3Llu+57341xabSmfj6j3zDauDDTDffM+jJUlNq9T+9+7nJFCa1F/jTufyxE1YkKLsSZLZya/dnWcM4uul7YVtXuKh96SeSg6ruJii1eIDuO9UvxCGj0Optv4DQA81+zAhiYFnQcTptkyFBUwE5kR7W3kQcCtDBYUqMZAMaVcXFm1vavacs7dG5CTb1Qw15FLrWoTza74Fmp53kuDkEKaDfNNYh6osIWoWbLYfDET0JVsiF2FK+KZs142x08u3mWL1ymYdWKeLAm8zY7wm3/W5KJrb1VCdJ69OONrvzp+hl8mtC/m3BLRb9dri9M8AbZWZB/ynSrEtz0K7mt6ClClET91kXalKk0aBwK3F8ujbFI9e+JrHtQJBZFALFkkZ/Yzu96PpUkd6TAa0TKVe7Q/NdqUWz36lLfK8KkWNctIO2LT+vUus2FVj7/o93Wjj6Qea71Z/Cb4iqK5I1MjBwSFr/YYGhV/xGJg1Uk1n5sEC/iNuF16pnknnYDx7278zC7s+PYDLStcazBEtyUQPDuFK6cpqHuXwZWA7DC4fLS3PQok/uVXIumYgXK3DlXRUI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(376002)(396003)(366004)(346002)(2906002)(2616005)(15650500001)(478600001)(36756003)(16576012)(31696002)(31686004)(38100700002)(15188445003)(38350700002)(966005)(66556008)(316002)(110136005)(956004)(6666004)(26005)(66946007)(186003)(8936002)(16526019)(66476007)(5660300002)(52116002)(86362001)(166002)(83380400001)(6486002)(8676002)(53546011)(33964004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?K2ZoRWoxdnVuQkk0dnR3b1dSU21CUDlkbFpkbGppcFJJbG5YTGk5TGhMVGxN?=
 =?utf-8?B?VmtnZG9OdkJRN1ZIbFA5cVJhWDN3cmhaVGhDZ2RydWhmWkwxbXgwL0pTS0ZY?=
 =?utf-8?B?aUxiOElraGwzaUxmSG5CTjV4Z2l3NGpJL3Vsb3NNSzY0UHdNOW81UEZlcU1P?=
 =?utf-8?B?M3BOOVpCbkdIRVNPSks2VzJmT1dsZFNEaE9LdlpWTlZEczE5L0duT2xBSnV3?=
 =?utf-8?B?Nyt6TVJKcDhCbFJtY0R1UStlT25HbmJNNFA2dmV6WGNiNCtUVExPeU41Rkly?=
 =?utf-8?B?ZGdyS1FCWDZJalFLek5TWW9naVFROFBqRm1XWEs2bFpjaG5OakhtaGVmeCtJ?=
 =?utf-8?B?dTdZeUJDNVpOcktTYW84Q3hQdENwTkRLRTlmTXNscUZQWVlCRmtCOVdZR1Ft?=
 =?utf-8?B?T3VON09vdjljQmdvY3BmOHI5YlpIMUcwdWM3SG9CMlVSa2V2K1dPbG14dGp0?=
 =?utf-8?B?OFdMMkdublVYV1ozK0dCaWREU2NhTXRHeE9ZK2JvMERqRXVsakovMGRTRXA0?=
 =?utf-8?B?RDVndXZRbzRUd1A3ckNRN0VuUjltWUxtbnBPdjNLZ0xlMTNxZlVVTTd2ZHZa?=
 =?utf-8?B?NFp0WWRjTUUzVm9BZ3NCTHk4WERXVE9aczQ4TVJOeXFINTFkdXBtbWU2Q2My?=
 =?utf-8?B?aTNRUTR6OGt2cnd1VjFFQnVqMXRub0xqSUc2WDhEVmlxSGdKNlY3dXhXd0tZ?=
 =?utf-8?B?VTJXNzRWMFhQamFydGpsZnRwYnlHTytHR1Rmdm5mc1FUT3AwM0FYNVdvM3NB?=
 =?utf-8?B?YU0wZW1YQzFTTnVyZFFzUVBLbDFUbExxTzVubE1yN0JlTTJ1MHJ1RSt5U2Vj?=
 =?utf-8?B?ZWcwRkw1Y3BhOEdnVWlFaFRXRCttcHhtZWRtaUJVNDQxMTJ6VEs0ampzNmlt?=
 =?utf-8?B?M214emYyWWJWNXdSRXBXVEZjbjlEeWpidXBESWRsV1F5ekZjRm1IZURmSXpO?=
 =?utf-8?B?QU4vUGVxVncxVkhnSFlxb0svTlFNMmxUQW1GZVBYa2NWTG9mOWFQWWx6dFpQ?=
 =?utf-8?B?bnU1Yi9OUWxnR3U1ZVVEdklucEw1QmF3Tms4ZWVJak9ZVDUxWUJQMnJSRFZj?=
 =?utf-8?B?ZjBuU09laCt1QU5Mb0JoT3M0VnRVL3pXTkZkL2FXY0I3cEk0eXI5cjVneXZs?=
 =?utf-8?B?dlVjcldzWUpXQ1YzNmVLeVJnMi9qYUVUQy9xRys0NUpmVHJxYjg3MERaNGcr?=
 =?utf-8?B?aTlQNHZFUVIwMW0vcVZtZWN2WVBsZmhGSURyTDhhTVB0SGNmamUxRjY2bllm?=
 =?utf-8?B?OG5Zd3Y4VTZkcXNkZXZBWlEwbkhkUnlQc3VPR1NHL3ZybzEyZ2pjeWlGOWEw?=
 =?utf-8?B?cjBxZy91aERqWmU0VnN6bVluUEtORlYyeUhmVWhSdHhxSU9TaEtRNlhudWJh?=
 =?utf-8?B?cW5LN1JjQTczMjNXZmh0OTJpWnBqVVMyMmNJRk1MYU04VldiZjZ5aG1oK2RH?=
 =?utf-8?B?NjlRblVUdXIzMmRKQ3FTVThYbERKUTliSmExZDE4TkhYSEhrWko2OFY4TDdl?=
 =?utf-8?B?ZElWeDRUZEpWNGU0MEhVS1NLZ2xxOEErTUQ4eFBWclV1ME5ENzF0UGI2MFpu?=
 =?utf-8?B?TDZ4YzM0c2poa05NdUE0eXNZVzlOK0IwM3lCSjdIM29nR3BBNlFuclF1aXVq?=
 =?utf-8?B?NVlHekYzQjlybVBmdk5UN1ZkK0dhUFVLYUNrUXF6cUlheFNGZFc0cFFmTmxS?=
 =?utf-8?B?VkRjNmpyTzRtNjY2MExHMDQvSnRoM0ZjZ3NsYUwvdjhsNC8vWk1UNDlDbUlz?=
 =?utf-8?Q?FsdE2Qopc6SHEB54UbkmQqarO8MyRbeWN9kJ3Gm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060d9c24-c91d-4b3a-ce3c-08d904210897
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 17:23:38.0430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LG2zkjP8GjGr8IVw9yjojEud37usDGZMFkJ/7D422guOUwQxlTqn54kf511GLBomrkG/TfrpWQlFmVPP2O08nfPPnWEMEEcEGOr0/nIfhAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3822
Content-Type: multipart/alternative;
 boundary="------------3FA53A5EC3EBB1AC91F89443"
Content-Language: en-CA

--------------3FA53A5EC3EBB1AC91F89443
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Add the oe-core list where patches are usually discussed.

On 2021-04-17 10:41 a.m., Shachar Menashe wrote:
> This adds proper TLS verification to wget

I think you should add some of the comments you made in the bugzilla here:

---

By enabling the busybox feature: WGET_OPENSSL it means that in builds 
WITH openssl (ex. sato)
the issue will be completely fixed, and in builds WITHOUT openssl, 
busybox will fallback
to using the internal (insecure) client which will print out a message
"note: TLS certificate validation not implemented" Note that busybox 
does not rely in any way on the OpenSSL library
(it just executes the standalone binary, if it is found) so
we shouldn't have linkage issues is CONFIG_FEATURE_WGET_OPENSSL is 
enabled but OpenSSL is not getting built.

---

Thanks for the explanation.
We could add a RSUGGESTS make the coupling more clear:

http://docs.yoctoproject.org/ref-manual/variables.html?highlight=rrecommends#term-RSUGGESTS

I don't use that feature at all and it's not widely used in oe-core so 
hopefully someone
opinionated will reply and help us out.

../Randy



> Signed-off-by: Shachar Menashe <shachar@vdoo.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 1 +
>  1 file changed, 1 insertion(+)
> diff --git a/meta/recipes-core/busybox/busybox.inc 
> b/meta/recipes-core/busybox/busybox.inc
> index 47fcb59302..8f274bd263 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -77,6 +77,7 @@ def features_to_busybox_settings(d):
>      busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv4', True, 
> False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
>      busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, 
> False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
>      busybox_cfg(bb.utils.contains_any('DISTRO_FEATURES', 'bluetooth 
> wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)
> +    busybox_cfg(True, 'CONFIG_FEATURE_WGET_OPENSSL', cnf, rem)
>      return "\n".join(cnf), "\n".join(rem)
>  # X, Y = ${@features_to_busybox_settings(d)}
> --
> 2.17.1
>
> 
>

-- 
# Randy MacLeod
# Wind River Linux


--------------3FA53A5EC3EBB1AC91F89443
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Add the oe-core list where patches are
      usually discussed.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2021-04-17 10:41 a.m., Shachar
      Menashe wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:mMlg.1618670463873919193.89er@lists.yoctoproject.org">
      
      <div>This adds proper TLS verification to wget</div>
    </blockquote>
    <p>I think you should add some of the comments you made in the
      bugzilla here:</p>
    <p>---<br>
    </p>
    <p class="bz_comment_text" id="comment_text_14">By enabling the
      busybox feature: WGET_OPENSSL it means that in builds WITH openssl
      (ex. sato) <br>
      the issue will be completely fixed, and in builds WITHOUT openssl,
      busybox will fallback <br>
      to using the internal (insecure) client which will print out a
      message <br>
      &quot;note: TLS certificate validation not implemented&quot;
      Note that busybox does not rely in any way on the OpenSSL library
      <br>
      (it just executes the standalone binary, if it is found) so <br>
      we shouldn't have linkage issues is CONFIG_FEATURE_WGET_OPENSSL is
      enabled but OpenSSL is not getting built.
    </p>
    <p>---<br>
    </p>
    <p>Thanks for the explanation.<br>
      We could add a RSUGGESTS make the coupling more clear:</p>
    <p>
<a class="moz-txt-link-freetext" href="http://docs.yoctoproject.org/ref-manual/variables.html?highlight=rrecommends#term-RSUGGESTS">http://docs.yoctoproject.org/ref-manual/variables.html?highlight=rrecommends#term-RSUGGESTS</a><br>
      <br>
    </p>
    <p>I don't use that feature at all and it's not widely used in
      oe-core so hopefully someone<br>
      opinionated will reply and help us out.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:mMlg.1618670463873919193.89er@lists.yoctoproject.org">
      <div>&nbsp;</div>
      <div>Signed-off-by: Shachar Menashe <a class="moz-txt-link-rfc2396E" href="mailto:shachar@vdoo.com">&lt;shachar@vdoo.com&gt;</a></div>
      <div>---</div>
      <div>&nbsp;meta/recipes-core/busybox/busybox.inc | 1 +</div>
      <div>&nbsp;1 file changed, 1 insertion(+)</div>
      <div>&nbsp;</div>
      <div>diff --git a/meta/recipes-core/busybox/busybox.inc
        b/meta/recipes-core/busybox/busybox.inc</div>
      <div>index 47fcb59302..8f274bd263 100644</div>
      <div>--- a/meta/recipes-core/busybox/busybox.inc</div>
      <div>+++ b/meta/recipes-core/busybox/busybox.inc</div>
      <div>@@ -77,6 +77,7 @@ def features_to_busybox_settings(d):</div>
      <div>&nbsp; &nbsp; &nbsp;busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv4',
        True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)</div>
      <div>&nbsp; &nbsp; &nbsp;busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6',
        True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)</div>
      <div>&nbsp; &nbsp; &nbsp;busybox_cfg(bb.utils.contains_any('DISTRO_FEATURES',
        'bluetooth wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)</div>
      <div>+&nbsp; &nbsp; busybox_cfg(True, 'CONFIG_FEATURE_WGET_OPENSSL', cnf,
        rem)</div>
      <div>&nbsp; &nbsp; &nbsp;return &quot;\n&quot;.join(cnf), &quot;\n&quot;.join(rem)</div>
      <div>&nbsp;</div>
      <div>&nbsp;# X, Y = ${@features_to_busybox_settings(d)}</div>
      <div>--</div>
      <div>2.17.1</div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------3FA53A5EC3EBB1AC91F89443--
