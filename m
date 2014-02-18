Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF386EC45
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 08:41:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1I8fjo5020200; Tue, 18 Feb 2014 08:41:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LaVghqORV1lV; Tue, 18 Feb 2014 08:41:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1I8fgrH020196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 18 Feb 2014 08:41:43 GMT
Message-ID: <1392712895.14081.197.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>
Date: Tue, 18 Feb 2014 08:41:35 +0000
In-Reply-To: <1392633988-14208-1-git-send-email-net147@gmail.com>
References: <1392633988-14208-1-git-send-email-net147@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/oe/image.py: fix working directory
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
X-List-Received-Date: Tue, 18 Feb 2014 08:41:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-02-17 at 21:46 +1100, Jonathan Liu wrote:
> The working directory needs to be changed before the image creation
> commands instead of afterwards.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/lib/oe/image.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
> index c15296f..31193f2 100644
> --- a/meta/lib/oe/image.py
> +++ b/meta/lib/oe/image.py
> @@ -176,8 +176,8 @@ class Image(object):
>              bb.data.update_data(localdata)
>              localdata.setVar('type', type)
>  
> -            cmds.append("\t" + localdata.getVar("IMAGE_CMD", True))
>              cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE}"))
> +            cmds.append("\t" + localdata.getVar("IMAGE_CMD", True))
>  
>              if type in cimages:
>                  for ctype in cimages[type]:

I applied this but ended up reverting it since its clear the image
commands assume a different working directory and this causes failures.

I'd like to see more explanation about the problem this is trying to
solve.

Cheers,

Richard


