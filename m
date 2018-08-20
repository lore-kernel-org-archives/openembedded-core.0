Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B63AD7920E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 01:49:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7K1n5Ls028718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Aug 2018 18:49:05 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 19 Aug 2018 18:49:04 -0700
To: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <8a3a6d85-3c46-3144-9530-7487ba773a2f@windriver.com>
Date: Mon, 20 Aug 2018 09:53:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [rocko][sumo][master][PATCH 1/2] bitbake.conf: add PERSISTENT_LOG_DIR variable
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
X-List-Received-Date: Mon, 20 Aug 2018 01:49:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

The requirement is to put logs into directories other than /var/log.
Could it be achieved by modifying the syslog daemon configuration file 
(e.g. /etc/syslog.conf) to replace /var/log with the specified 
directory. Maybe the corresponding logrotate configuration file also 
needs to be modified.

Best Regards,
Chen Qi

On 08/18/2018 08:59 AM, Ankur Tyagi wrote:
> This variable is only respected when VOLATILE_LOG_DIR is "no".
>
> The default value is "" which results in the /var/log being log directory.
>
> The user could override this value to a path e.g "/home/root/log" which
> results /var/log being a link pointing to /home/root/log directory on
> persistent storage.
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>   meta/conf/bitbake.conf | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e5dc1ac..9db22c8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -88,6 +88,8 @@ ROOT_HOME ??= "/home/root"
>   # If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to /var/volatile/log.
>   # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
>   VOLATILE_LOG_DIR ?= "yes"
> +# If VOLATILE_LOG_DIR is false and PERSISTENT_LOG_DIR is set, /var/log links to PERSISTENT_LOG_DIR
> +PERSISTENT_LOG_DIR ??= ""
>   
>   ##################################################################
>   # Architecture-dependent build variables.



