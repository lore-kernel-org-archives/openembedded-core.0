Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3Rg8-0007g4-I0 for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 13:33:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22CPEvh030922
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:25:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29538-10 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 12:25:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22CP6cJ030916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:25:07 GMT
Message-ID: <1330691109.15224.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 12:25:09 +0000
In-Reply-To: <81a428ea0e7515ab09e707fbdaba9b1a1b5050b6.1330684260.git.liezhi.yang@windriver.com>
References: <cover.1330684260.git.liezhi.yang@windriver.com>
	<81a428ea0e7515ab09e707fbdaba9b1a1b5050b6.1330684260.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] V2 Fix libpam's chmod
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
X-List-Received-Date: Fri, 02 Mar 2012 12:33:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-02 at 18:34 +0800, Robert Yang wrote:
> The libpam's has an error when generating the rootfs:
> 
> chmod: cannot access `/usr/sbin/unix_chkpwd': No such file or directory
> 
> This is because the following code in libpam_1.1.5.bb:
> 
> pkg_postinst_pam-plugin-unix () {
>     # below is necessary to allow unix_chkpwd get user info from shadow file
>     # on lsb images
>     chmod 4755 ${sbindir}/unix_chkpwd
> }
> 
> This is to set the setuid permission for unix_chkpwd (the lsb test
> requires this), but it lacks a "${D}", and we can do this in the install
> stage.
> 
> [YOCTO #2049]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-extended/pam/libpam_1.1.5.bb |    9 +++------
>  1 files changed, 3 insertions(+), 6 deletions(-)

Merged to master, thanks.

Richard



