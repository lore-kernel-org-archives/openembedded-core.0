Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rmq1c-0007OD-Iv for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 18:07:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0GGxejL022344
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 16:59:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21654-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 16:59:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0GGxTli022338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 16:59:31 GMT
Message-ID: <1326733174.2933.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jan 2012 16:59:34 +0000
In-Reply-To: <2588490b8b8424c96da2824c604929baeb1c5c16.1326714004.git.lianhao.lu@intel.com>
References: <cover.1326714004.git.lianhao.lu@intel.com>
	<2588490b8b8424c96da2824c604929baeb1c5c16.1326714004.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] gcc-common.inc: Added shared source support for basichash.
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
X-List-Received-Date: Mon, 16 Jan 2012 17:07:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-16 at 19:43 +0800, Lianhao Lu wrote:
> [YOCTO #1555]
> Adding new mechanism to allow multiple gcc related recipes sharing the
> same src directory when using the basichash as the signature handler.
> 
> Using the same stamp file for multiple gcc related recipes to share the
> same src directory is no longer working when using the basichash
> signature.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-common.inc |   56 ++++++++++++++++++++++++++++++
>  1 files changed, 56 insertions(+), 0 deletions(-)

Can you please check if this can be fixed by:

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index d014980..3a82720 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -77,6 +77,9 @@ do_headerfix () {
 
 addtask headerfix after do_unpack before do_patch
 
+CROSS_TARGET_SYS_DIR[vardepsexclude] = "PN"
+CROSS_TARGET_SYS_DIR[vardepvalue] = "1"
+
 do_configure_prepend () {
        # teach gcc to find correct target includedir when checking libc ssp support
        mkdir -p ${B}/gcc

as discussed in the "sstate info" thread?

Cheers,

Richard





