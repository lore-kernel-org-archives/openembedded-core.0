Return-Path: <prvs=434a04efd=Martin.Hundeboll@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 008A278253
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 05:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=2665; q=dns/txt;
	s=ironport2; t=1506316732; x=1537852732;
	h=from:subject:cc:references:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=YoMsRCw8uX07TRnNGYoh8uePbUGX7nxYxokidq8DNC8=;
	b=PoBZnoqBncNH9XvGKDCKc+ondT/g54oPzew6nfhTOARTAqGFWh1SwNmq
	OobHgqI2R3FL7yIbEzSp/Mtq/vta5kVt3xqYvgdN6nJchmR7+0L6fPJyF
	X/sOGh5bKHE5KJnk+6oN4p/HbLlfILatbFbp0azRsnlA4zwxiwkImvimm 4=;
X-IronPort-AV: E=Sophos;i="5.42,435,1500933600"; 
   d="scan'208";a="2511286"
Received: from vmprevas3.prevas.se (HELO smtp.prevas.se) ([172.16.8.103])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2017 07:18:50 +0200
Received: from [172.16.11.54] (172.16.8.31) by smtp.prevas.se (172.16.8.103)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 25 Sep 2017 07:18:49 +0200
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
CC: <openembedded-core@lists.openembedded.org>
References: <1506282757-32998-1-git-send-email-ee.peng.yeoh@intel.com>
Message-ID: <f222b1f4-63ed-275e-6a20-2d85b4e201d8@prevas.dk>
Date: Mon, 25 Sep 2017 07:18:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506282757-32998-1-git-send-email-ee.peng.yeoh@intel.com>
X-Originating-IP: [172.16.8.31]
Subject: Re: [PATCH] sanity.bbclass: uppercase check for machine and distro
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
X-List-Received-Date: Mon, 25 Sep 2017 05:18:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2017-09-24 21:52, Yeoh Ee Peng wrote:
> Uppercase in machine and distro will result in unexpected
> behavior.

Wouldn't other checks make sense as well; e.g. underscore or starting 
with "pn-" ?

I'd prefer a whitelist check instead of an ever growing number of 
blacklist checks.

// Martin

> QA check will produce error message if it verified that
> machine or distro is uppercase.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>   meta/classes/sanity.bbclass | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 1feb794..82efaef 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -694,6 +694,13 @@ def sanity_check_locale(d):
>       except locale.Error:
>           raise_sanity_error("You system needs to support the en_US.UTF-8 locale.", d)
>   
> +def check_name_uppercase(type, name):
> +    import re
> +    messages = ""
> +    if re.search('[A-Z]', name):
> +        messages = messages + "%s: '%s' is uppercase. Please correct it to lowercase to avoid unexpected behavior.\n" % (type, name)
> +    return messages
> +
>   def check_sanity_everybuild(status, d):
>       import os, stat
>       # Sanity tests which test the users environment so need to run at each build (or are so cheap
> @@ -723,6 +730,7 @@ def check_sanity_everybuild(status, d):
>       # need to take into account DISTRO renaming DISTRO
>       distro = d.getVar('DISTRO')
>       if distro and distro != "nodistro":
> +        status.addresult(check_name_uppercase('DISTRO', d.getVar('DISTRO')))
>           if not ( check_conf_exists("conf/distro/${DISTRO}.conf", d) or check_conf_exists("conf/distro/include/${DISTRO}.inc", d) ):
>               status.addresult("DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % d.getVar("DISTRO"))
>   
> @@ -743,6 +751,7 @@ def check_sanity_everybuild(status, d):
>       # Check that the MACHINE is valid, if it is set
>       machinevalid = True
>       if d.getVar('MACHINE'):
> +        status.addresult(check_name_uppercase('MACHINE', d.getVar('MACHINE')))
>           if not check_conf_exists("conf/machine/${MACHINE}.conf", d):
>               status.addresult('MACHINE=%s is invalid. Please set a valid MACHINE in your local.conf, environment or other configuration file.\n' % (d.getVar('MACHINE')))
>               machinevalid = False
> 

-- 
MARTIN HUNDEBØLL, Prevas A/S
Software Developer

Hedeager 3, DK-8200 Aarhus N
Phone +45 87438070
Mobile +45 25562438
Martin.Hundeboll@prevas.dk
www.prevas.com

