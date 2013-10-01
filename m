Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3B16007B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 17:01:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r91H1Hqn005926
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Oct 2013 10:01:17 -0700 (PDT)
Received: from msp-dhcp16.wrs.com (172.25.34.16) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 1 Oct 2013 10:01:17 -0700
Message-ID: <524AFFDD.7090502@windriver.com>
Date: Tue, 1 Oct 2013 12:01:17 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1380646260-15245-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1380646260-15245-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] makedevs: Do not return error if the fifo exisits
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
X-List-Received-Date: Tue, 01 Oct 2013 17:01:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/13 11:51 AM, Saul Wold wrote:
> This ensures that makedevs will not cause image creation failures
> when it encounters a pipe (fifo) that exists from a previous image.
> The other file/device creation code either ignore this error or check
> for file type.
>
> [YOCTO #5288]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
> index 5d2c45b..7b0487f 100644
> --- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
> +++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
> @@ -274,7 +274,7 @@ static void add_new_file(char *name, char *path, unsigned long uid,
>   static void add_new_fifo(char *name, char *path, unsigned long uid,
>   				  unsigned long gid, unsigned long mode)
>   {
> -	if (mknod(path, mode, 0))
> +	if (mknod(path, mode, 0) && errno != EEXIST)
>   		error_msg_and_die("%s: file can not be created with mknod!", path);
>   	chown(path, uid, gid);
>   //	printf("File: %s %s  UID: %ld  GID: %ld  MODE: %04lo\n",
>

Ya, I'm happy with this.  It avoids recreating it if it exists.. no error.

No idea if a warning is reasonable in this case, but I'm happy with the change.

--Mark

