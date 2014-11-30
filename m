Return-Path: <msach@mailbox.tu-berlin.de>
X-Greylist: delayed 1178 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 30 Nov 2014 21:58:01 UTC
Received: from mail.tu-berlin.de (mail.tu-berlin.de [130.149.7.33])
	by mail.openembedded.org (Postfix) with ESMTP id 37D8C6AC45
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Nov 2014 21:58:01 +0000 (UTC)
X-tubIT-Incoming-IP: 85.178.63.15
Received: from e178063015.adsl.alicedsl.de ([85.178.63.15]
	helo=[192.168.1.201])
	by mail.tu-berlin.de (exim-4.72/mailfrontend-8) with esmtpa 
	for <openembedded-core@lists.openembedded.org>
	id 1XvCCD-0003GT-jL; Sun, 30 Nov 2014 22:38:22 +0100
Message-ID: <547B8E4A.1010601@mailbox.tu-berlin.de>
Date: Sun, 30 Nov 2014 22:38:18 +0100
From: Merten Sach <msach@mailbox.tu-berlin.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1416693295-21521-1-git-send-email-msach@mailbox.tu-berlin.de>
In-Reply-To: <1416693295-21521-1-git-send-email-msach@mailbox.tu-berlin.de>
X-PMX-Version: 6.0.0.2142326, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2014.11.30.212721
X-PMX-Spam: Gauge=IIIIIII, Probability=0%, Report=''
Subject: Re: [PATCH] metadata_scm: Fix crash due to uncaught python exception
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
X-List-Received-Date: Sun, 30 Nov 2014 21:58:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

I submitted a patch about a week ago and haven't got any feedback.

This is my first patch submission to the openenmbedded project, so I'm eager to know if I missed out on anything.

Thanks
Merten

On 22/11/14 22:54, Merten Sach wrote:
> Function base_get_metadata_svn_revision was crashing due to an uncaught
> IndexError exception.
> 
> The except notation without parentheses is legacy syntax. It is the equivalent
> to 'except IOError as IndexError' which is not what we want here.
> 
> The change catches both exceptions.
> 
> Signed-off-by: Merten Sach <msach@mailbox.tu-berlin.de>
> ---
>  meta/classes/metadata_scm.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
> index ba0edf9..237e618 100644
> --- a/meta/classes/metadata_scm.bbclass
> +++ b/meta/classes/metadata_scm.bbclass
> @@ -60,7 +60,7 @@ def base_get_metadata_svn_revision(path, d):
>      try:
>          with open("%s/.svn/entries" % path) as f:
>              revision = f.readlines()[3].strip()
> -    except IOError, IndexError:
> +    except (IOError, IndexError):
>          pass
>      return revision
>  
> 

