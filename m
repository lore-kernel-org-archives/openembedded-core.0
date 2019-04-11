Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7E0F7BF70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 06:29:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3B6TSQK013105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 23:29:28 -0700 (PDT)
Received: from [128.224.162.190] (128.224.162.190) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 10 Apr 2019 23:29:27 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1548386264.git.Qi.Chen@windriver.com>
	<2e971d062525b21d52a68d1926927f1a60af08d8.1548386264.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <0fcf04ce-457c-df87-bd2b-09a7077e654f@windriver.com>
Date: Thu, 11 Apr 2019 14:40:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <2e971d062525b21d52a68d1926927f1a60af08d8.1548386264.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.190]
Subject: Re: [PATCH 1/1] runqemu: do not check return code of tput
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
X-List-Received-Date: Thu, 11 Apr 2019 06:29:27 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 01/25/2019 11:18 AM, Chen Qi wrote:
> The subprocess.run was replaced by subprocess.check_call because
> of compatibility support down to python 3.4. But we really don't
> care about whether that command succeeds. Some user reports that
> in some tmux environment, this command fails and gives some
> unpleasant traceback output. So we use 'call' instead of 'check_call'
> to avoid such problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   scripts/runqemu | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index c4a0ca8..d3239ee 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1318,7 +1318,7 @@ def main():
>               logger.info("SIGTERM received")
>               os.kill(config.qemupid, signal.SIGTERM)
>               config.cleanup()
> -            subprocess.check_call(["tput", "smam"])
> +            subprocess.call(["tput", "smam"])
>           signal.signal(signal.SIGTERM, sigterm_handler)
>   
>           config.check_args()
> @@ -1340,7 +1340,7 @@ def main():
>           return 1
>       finally:
>           config.cleanup()
> -        subprocess.check_call(["tput", "smam"])
> +        subprocess.call(["tput", "smam"])
>   
>   if __name__ == "__main__":
>       sys.exit(main())



