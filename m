Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Sj6BA-00033T-BG
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 12:05:56 +0200
Received: from [192.168.0.49] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id D5FC5600D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 10:45:06 +0100 (BST)
Message-ID: <4FE835BC.2060009@communistcode.co.uk>
Date: Mon, 25 Jun 2012 10:56:12 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1340615583-21184-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1340615583-21184-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH] lighttpd: fix FastCGI configuration for PHP
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2012 10:05:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 25/06/12 10:13, Marcin Juszkiewicz wrote:
> /usr/local/bin/php was set as PHP interpreter so lighttpd failed to run.
> Also uncommented FastCGI configuration block to make mod_fastcgi
> enablement easier for user.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   meta/recipes-extended/lighttpd/files/lighttpd.conf |   16 ++++++++--------
>   meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |    2 +-
>   2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-extended/lighttpd/files/lighttpd.conf b/meta/recipes-extended/lighttpd/files/lighttpd.conf
> index 3342470..0838da8 100644
> --- a/meta/recipes-extended/lighttpd/files/lighttpd.conf
> +++ b/meta/recipes-extended/lighttpd/files/lighttpd.conf
> @@ -211,14 +211,14 @@ static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
>   #### fastcgi module
>   ## read fastcgi.txt for more info
>   ## for PHP don't forget to set cgi.fix_pathinfo = 1 in the php.ini
> -#fastcgi.server             = ( ".php" =>
> -#                               ( "localhost" =>
> -#                                 (
> -#                                   "socket" => "/tmp/php-fastcgi.socket",
> -#                                   "bin-path" => "/usr/local/bin/php"
> -#                                 )
> -#                               )
> -#                            )
> +fastcgi.server             = ( ".php" =>
> +                               ( "localhost" =>
> +                                 (
> +                                   "socket" => "/tmp/php-fastcgi.socket",
> +                                   "bin-path" => "/usr/bin/php-cgi"

Changing the path here I agree with.

>
> +                                 )
> +                               )
> +                            )
>   
>   #### CGI module
>   #cgi.assign                 = ( ".pl"  => "/usr/bin/perl",
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
> index 161c0d9..99b359c 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
> @@ -16,7 +16,7 @@ RDEPENDS_${PN} += " \
>                  lighttpd-module-staticfile \
>   "
>   
> -PR = "r1"
> +PR = "r2"
>   
>   SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
>           file://index.html.lighttpd \

However I don't think we should be enabling php-cgi by default, 
especially as it is not included in oe-core. Uncommenting some lines in 
a configuration file should be manageable by users that can build (and 
add additional layers to) OpenEmbedded.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



