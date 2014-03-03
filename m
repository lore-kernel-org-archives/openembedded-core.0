Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 098D96E76D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 14:59:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s23ExqOL010322
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Mar 2014 06:59:52 -0800 (PST)
Received: from [147.11.119.201] (147.11.119.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 3 Mar 2014 06:59:51 -0800
Message-ID: <531498E3.1090004@windriver.com>
Date: Mon, 3 Mar 2014 08:59:47 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1393781961.22581.7.camel@ted>
In-Reply-To: <1393781961.22581.7.camel@ted>
Subject: Re: [PATCH RFC] bitbake.conf/base.bbclass: Drop PRINC support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Mar 2014 14:59:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/2/14, 11:39 AM, Richard Purdie wrote:
> PRINC is no longer needed since we have the PR service instead
> which people should be using. Drop the PRINC code.

Will dropping this support break someone who is moving from a prior version of 
oe-core (i.e. will any of the PRs go backwards?)

--Mark

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 3e9051c..3cbf2cb 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -455,18 +455,6 @@ python () {
>           else:
>               appendVar('EXTRA_OECONF', extraconf)
>
> -    # If PRINC is set, try and increase the PR value by the amount specified
> -    princ = d.getVar('PRINC', True)
> -    if princ and princ != "0":
> -        pr = d.getVar('PR', True)
> -        pr_prefix = re.search("\D+",pr)
> -        prval = re.search("\d+",pr)
> -        if pr_prefix is None or prval is None:
> -            bb.error("Unable to analyse format of PR variable: %s" % pr)
> -        nval = int(prval.group(0)) + int(princ)
> -        pr = pr_prefix.group(0) + str(nval) + pr[prval.end():]
> -        d.setVar('PR', pr)
> -
>       pn = d.getVar('PN', True)
>       license = d.getVar('LICENSE', True)
>       if license == "INVALID":
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 4879aa2..a4a7107 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -188,7 +188,6 @@ ASSUME_PROVIDED = "\
>   PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or 'defaultpkgname'}"
>   PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[1] or '1.0'}"
>   PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[2] or 'r0'}"
> -PRINC ?= "0"
>   PF = "${PN}-${EXTENDPE}${PV}-${PR}"
>   EXTENDPE = "${@['','${PE\x7d_'][int(d.getVar('PE',1) or 0) > 0]}"
>   P = "${PN}-${PV}"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


