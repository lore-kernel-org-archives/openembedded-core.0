Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1ThmzU-0004RF-Kg
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Dec 2012 20:56:44 +0100
Received: from mail-pa0-f69.google.com ([209.85.220.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 09 Dec 2012 11:42:13 -0800
Received: by mail-pa0-f69.google.com with SMTP id rl6so3246504pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Dec 2012 11:42:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=H2MnzY2lTCeNeGT5Brd6Kv7F5UVOHX0qW0J+s6rzJOY=;
	b=YDUajJdL1mn+1tEvz39NkGgXeyWVvMQp/jbPn4jiR1C2gj9/5duRRHJJXLvo5ymm87
	6zZ6te5mbWpOmkYS14Pem/1uWgjSQ0jn3n2msHTHllTx00ZVObHbI/3LLO2BYPh3A8n5
	WqZ9flMaBEvqM1E32hBX6hC0rOLKzKpTP7rRqmrihIm/c22+0OQq77iToWfb4rDd+Uba
	JygjpuSns34PQJDx7S1OfEpbEdVZ+Gymg7yTrOs23yzUt8cjAWFqQ4ZhEU+TaQzVwSnZ
	CujDl/5u7hYt0ycqybVzbh8Sl2b7YXJjYeehu1b84w0KKWUB+ToMlxRng9K2Hgpti1oI
	2EKw==
Received: by 10.68.253.232 with SMTP id ad8mr32611252pbd.73.1355082132892;
	Sun, 09 Dec 2012 11:42:12 -0800 (PST)
Received: by 10.68.253.232 with SMTP id ad8mr32611232pbd.73.1355082132742;
	Sun, 09 Dec 2012 11:42:12 -0800 (PST)
Received: from [10.1.10.13] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id p10sm10479232pax.27.2012.12.09.11.42.11
	(version=SSLv3 cipher=OTHER); Sun, 09 Dec 2012 11:42:12 -0800 (PST)
Message-ID: <50C4E993.8050607@intel.com>
Date: Sun, 09 Dec 2012 11:42:11 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.DEB.2.02.1212090736560.4965@oneiric>
In-Reply-To: <alpine.DEB.2.02.1212090736560.4965@oneiric>
X-Gm-Message-State: ALoCoQnT2vDbI7xhRzB7liPQGE57tublzoN/oKThWj5DPOc/YmPJJh+WLIauCqYa02BiZmpo/GzsxCd69TSzR1OMZFndWElFGTvadwOeX8n1sjb9awuJZj/tluMnwNYgihlhKtUKgjWt1I0aMamLyHrrZ0ugCA4SOITW4ZKkwlU9uMaSYAqlH+3HsEx9GVfcccUnEII2eh0S
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] documentation-audit.sh: Add/fix checks for skipped lines.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Dec 2012 19:56:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2012 04:39 AM, Robert P. J. Day wrote:
>
> Have the script skip:
>
>    * "Recipe" lines.
>    * Lines with 11 "=", not 12.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Yeah, I haven't run this script since we switched to the knotty2 
interface. If you've tested this, I'm okay with the changes.

Scott

>
> ---
>
>    if scott wants to adjust this differently, it's all his.
>
> diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
> index a2c4586..2144aac 100755
> --- a/scripts/contrib/documentation-audit.sh
> +++ b/scripts/contrib/documentation-audit.sh
> @@ -30,9 +30,10 @@ echo " you'll get false positives.  For example, LICENSE_FLAGS_WHITELIST = \"Com
>
>   for pkg in `bitbake -s | awk '{ print \$1 }'`; do
>   	if [[ "$pkg" == "Loading" || "$pkg" == "Loaded" ||
> +	  "$pkg" == "Recipe"  ||
>             "$pkg" == "Parsing" || "$pkg" == "Package" ||
>             "$pkg" == "NOTE:"   || "$pkg" == "WARNING:" ||
> -          "$pkg" == "done."   || "$pkg" == "============" ]]
> +          "$pkg" == "done."   || "$pkg" == "===========" ]]
>   	then
>   		# Skip initial bitbake output
>   		continue
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


