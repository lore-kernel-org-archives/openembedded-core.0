Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C89A27C466
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 07:45:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x247ietD021485
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Mar 2019 23:45:06 -0800
Received: from [128.224.163.177] (128.224.163.177) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 3 Mar 2019 23:44:54 -0800
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20190204181314.22496-1-raj.khem@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <e0f4b1c8-54f9-63c9-b08b-147243ebe1ce@windriver.com>
Date: Mon, 4 Mar 2019 15:50:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190204181314.22496-1-raj.khem@gmail.com>
Subject: Re: [PATCH] send-error-report: Use https instead of http protocol
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
X-List-Received-Date: Mon, 04 Mar 2019 07:45:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

We have an internal error web server, this patch breaks it:

You're accessing the development server over HTTPS, but it only supports HTTP

So I tried to use runsslserver, but it doesn't work either since the host is
Ubuntu 14.04 (python 2.7.6):

$ python manage.py runsslserver

[snip]
     ssl_version=ssl.PROTOCOL_TLSv1_2,
AttributeError: 'module' object has no attribute 'PROTOCOL_TLSv1_2'

This is because python is old.

I think that make it default to https would make the server harder to set up,
so is it possible to:

* Make it default to http, and add an option such as --https (or --ssl) for https

Or:

* Add an option such as --no-ssl to make it use http.

I prefer the first one since https server is harder to setup than http in 
django. I can work on it if no objections.

// Robert

On 2/5/19 2:13 AM, Khem Raj wrote:
> errors.yp.org can understand https
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   scripts/send-error-report | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/send-error-report b/scripts/send-error-report
> index 8939f5f594..3528cf93a9 100755
> --- a/scripts/send-error-report
> +++ b/scripts/send-error-report
> @@ -62,7 +62,7 @@ def edit_content(json_file_path):
>   
>   def prepare_data(args):
>       # attempt to get the max_log_size from the server's settings
> -    max_log_size = getPayloadLimit("http://"+args.server+"/ClientPost/JSON")
> +    max_log_size = getPayloadLimit("https://"+args.server+"/ClientPost/JSON")
>   
>       if not os.path.isfile(args.error_file):
>           log.error("No data file found.")
> @@ -132,9 +132,9 @@ def send_data(data, args):
>       headers={'Content-type': 'application/json', 'User-Agent': "send-error-report/"+version}
>   
>       if args.json:
> -        url = "http://"+args.server+"/ClientPost/JSON/"
> +        url = "https://"+args.server+"/ClientPost/JSON/"
>       else:
> -        url = "http://"+args.server+"/ClientPost/"
> +        url = "https://"+args.server+"/ClientPost/"
>   
>       req = urllib.request.Request(url, data=data, headers=headers)
>       try:
> 

