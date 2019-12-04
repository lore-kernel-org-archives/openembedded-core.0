Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E58926D230
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 00:25:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xB40PpXK020033
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Dec 2019 16:25:51 -0800 (PST)
Received: from [128.224.162.189] (128.224.162.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 3 Dec 2019 16:25:50 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1573547565-352904-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <fc362303-861c-8d71-9a4e-493c1444d977@windriver.com>
Date: Wed, 4 Dec 2019 08:25:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1573547565-352904-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.189]
Subject: Re: [PATCH] report-error.bbclass: replace angle brackets with &lt; and &gt;
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
X-List-Received-Date: Wed, 04 Dec 2019 00:25:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ping

On 11/12/19 4:32 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> when we have below content in local.conf or auto.conf:
> BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj <raj.khem@gmail.com>"
> send-error-report will fail with "HTTP Error 500: OK"
>
> error-report-web do rudimentary check on all fields that are
> passed to the graphs page to avoid any XSS happening, if contains
> '<', the server will return error(Invalid characters in json).
> fixed by use escape of <> to replace it.
>
> NOTE: with this change, error-report-web need to add filter 'safe'
> for the string wanted to display to avoid further HTML escaping
> prior to output. Below is how the content displayed on webpage:
> with the filter 'safe':
> BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj <raj.khem@gmail.com>"
> without the filter 'safe':
> BUILDHISTORY_COMMIT_AUTHOR ?= "Khem Raj &lt;raj.khem@gmail.com&gt;"
>
> Another patch for error-report-web will send to yocto mail list.
>
> [YOCTO #13252]
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/classes/report-error.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
> index 1a12db1..6046867 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -36,6 +36,7 @@ def get_conf_data(e, filename):
>                       continue
>                   else:
>                       jsonstring=jsonstring + line
> +    jsonstring = jsonstring.replace("<", "&lt;").replace(">", "&gt;")
>       return jsonstring
>   
>   python errorreport_handler () {

