Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2744065DC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 15:56:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3UFkg2q032321; Wed, 30 Apr 2014 16:46:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iJ_Vs1Kh1S24; Wed, 30 Apr 2014 16:46:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3UFkd9L032315
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Apr 2014 16:46:41 +0100
Message-ID: <1398872793.16672.526.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Radek Dostal <radek.dostal@streamunlimited.com>
Date: Wed, 30 Apr 2014 16:46:33 +0100
In-Reply-To: <1398862918-1604-1-git-send-email-radek.dostal@streamunlimited.com>
References: <1398862918-1604-1-git-send-email-radek.dostal@streamunlimited.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] distutils.bbclass: only modify *.py file if it contains path to be removed
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
X-List-Received-Date: Wed, 30 Apr 2014 15:56:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-04-30 at 15:01 +0200, Radek Dostal wrote:
> Currently sed command touches every single *.py file. This modifies the
> timestamp of the file. All *.pyo files will be recompiled during the first
> boot, because timestamp will not match. This should be only necessary if
> sed command changes the file.
> 
> Signed-off-by: Radek Dostal <radek.dostal@streamunlimited.com>
> ---
>  meta/classes/distutils.bbclass |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> index f3da023..cd1d148 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -43,7 +43,11 @@ distutils_do_install() {
>  
>          # support filenames with *spaces*
>          find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
> -            sed -i -e s:${D}::g "$i"
> +            # only modify file if it contains path to avoid recompilation on the target
> +            if (cat "$i" | grep "${D}") >/dev/null 2>&1

Can we do something here which doesn't involve three different shell
calls please?

Cheers,

Richard


> +            then
> +                sed -i -e s:${D}::g "$i"
> +            fi
>          done
>  
>          if test -e ${D}${bindir} ; then	
> -- 
> 1.7.9.5
> 



