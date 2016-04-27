Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BD5566B6EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 13:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3RD3aXJ019939; Wed, 27 Apr 2016 14:03:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ASLBqwBWrOvQ; Wed, 27 Apr 2016 14:03:36 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3RD3WP8019911
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 Apr 2016 14:03:33 +0100
Message-ID: <1461762212.31320.182.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>,
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 14:03:32 +0100
In-Reply-To: <1461760323-27285-2-git-send-email-matt@madison.systems>
References: <1461760323-27285-1-git-send-email-matt@madison.systems>
	<1461760323-27285-2-git-send-email-matt@madison.systems>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] image.bbclass: don't expand IMAGE_CMD when setting do_image task
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
X-List-Received-Date: Wed, 27 Apr 2016 13:03:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-04-27 at 05:32 -0700, Matt Madison wrote:
> Expanding it causes the do_image_x function to include values of
> variables that may contain date/time stamps, rather than references
> to the variable names, leading to spurious taskhash mismatch errors.
> 
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/classes/image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 8bfd241..d695d30 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -380,7 +380,7 @@ python () {
>          localdata.delVar('DATETIME')
>          localdata.delVar('TMPDIR')
>  
> -        image_cmd = localdata.getVar("IMAGE_CMD", True)
> +        image_cmd = localdata.getVar("IMAGE_CMD", False)
>          vardeps.add('IMAGE_CMD_' + realt)
>          if image_cmd:
>              cmds.append("\t" + image_cmd)

You can't do this since there are some variables that need to be
expanded using the values from the current localdata copy of the data
store (such as the type variable).

We'd previously tried to avoid DATETIME contanination by removing the
problem bases with the delVar calls just above this.

Cheers,

Richard

