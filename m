Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1RCJ5Z-00078z-7v
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 00:40:22 +0200
Received: by bke11 with SMTP id 11so5518573bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 15:34:40 -0700 (PDT)
Received: by 10.223.75.27 with SMTP id w27mr462709faj.11.1318026880280;
	Fri, 07 Oct 2011 15:34:40 -0700 (PDT)
Received: from [172.20.1.6] (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id r6sm2611575fam.0.2011.10.07.15.34.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 15:34:39 -0700 (PDT)
Message-Id: <7F3A6782-444C-4722-8791-6D75B70FEB57@dominion.thruhere.net>
From: Koen Kooi <koen@beagleboard.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <bc7e830e85f9f5242e0178dee517d24cbdfc9fa3.1318021323.git.kergoth@gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sat, 8 Oct 2011 00:34:30 +0200
References: <cover.1318021323.git.kergoth@gmail.com>
	<bc7e830e85f9f5242e0178dee517d24cbdfc9fa3.1318021323.git.kergoth@gmail.com>
X-Mailer: Apple Mail (2.936)
Subject: Re: [PATCH 1/3] autotools: fix multi-word arguments for EXTRA_OECONF
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
X-List-Received-Date: Fri, 07 Oct 2011 22:40:22 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 7 okt 2011, om 23:02 heeft Christopher Larson het volgende  
geschreven:

> This is needed to better support things like the following (with a
> multi-word BUILD_CC):
>
>    EXTRA_OECONF += '"ac_cv_prog_CC_FOR_BUILD=${BUILD_CC}"'
>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
> meta/classes/autotools.bbclass |   14 ++++++--------
> 1 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/ 
> autotools.bbclass
> index a4ce851..135be33 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -70,14 +70,12 @@ CONFIGUREOPT_DEPTRACK = "--disable-dependency- 
> tracking"
>
>
> oe_runconf () {
> -	if [ -x ${S}/configure ] ; then
> -		cfgcmd="${S}/configure \
> -		${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
> -		bbnote "Running $cfgcmd..."
> -		$cfgcmd || bbfatal "oe_runconf failed"
> -	else
> -		bbfatal "no configure script found"
> -	fi
> +       if [ -x ${S}/configure ] ; then
> +	       bbnote "Running ${S}/configure ${CONFIGUREOPTS} $ 
> {EXTRA_OECONF} $@"
> +	       ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@" ||  
> bbfatal "oe_runconf failed"
> +       else
> +	       bbfatal "no configure script found"
> +       f

Was the tab->spaces conversion intentional?


