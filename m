Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E332779952
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:44:48 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8TCim6v026865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 29 Sep 2018 13:44:49 +0100
Message-ID: <ca4435b5ac4b9deecf9a3fd2eb9c89b86f435056.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Sat, 29 Sep 2018 13:44:48 +0100
In-Reply-To: <e264c183d7ab6ce4087ac6fca6bd6cadff6026c4.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<e264c183d7ab6ce4087ac6fca6bd6cadff6026c4.1538199671.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 03/10] man-db: fix multilib install file conflict
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
X-List-Received-Date: Sat, 29 Sep 2018 12:44:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> The first line of config file man_db.conf is the package name. It
> causes
> multilib install file conflict. So remove the first line.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-extended/man-db/man-db_2.8.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-extended/man-db/man-db_2.8.3.bb
> b/meta/recipes-extended/man-db/man-db_2.8.3.bb
> index 97e5a3d6fb..da6d291011 100644
> --- a/meta/recipes-extended/man-db/man-db_2.8.3.bb
> +++ b/meta/recipes-extended/man-db/man-db_2.8.3.bb
> @@ -26,6 +26,9 @@ do_install() {
>  	        install -d ${D}/etc/default/volatiles
>  		install -m 0644 ${WORKDIR}/99_mandb
> ${D}/etc/default/volatiles
>  	fi
> +
> +    # the 1st line of man_db.conf is package name which causes
> multilib install file conflict
> +    sed -i '1d' ${D}${sysconfdir}/man_db.conf
>  }

Please do this with a patch, not a sed expression.

The sed expressions are a maintenance nightmare since we don't know
if/when the config file may change, or if/when this expression stops
working.

Cheers,

Richard


