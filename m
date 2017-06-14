Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF6B780F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 13:51:42 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 4BD7268A019; Wed, 14 Jun 2017 14:51:42 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 6A81868A019;
	Wed, 14 Jun 2017 14:51:38 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 0906B674031E;
	Wed, 14 Jun 2017 15:51:38 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1497447757-30951-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <7b5ced3d-4b53-4404-ab7f-f1179e94d122@mlbassoc.com>
Date: Wed, 14 Jun 2017 15:51:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1497447757-30951-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/3] pseudo: Handle too many files deadlock
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
X-List-Received-Date: Wed, 14 Jun 2017 13:51:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-06-14 15:42, Richard Purdie wrote:
> If we have large amounts of parallelism, pseudo can end up with too
> many open connections and will no longer accept further connections,
> hanging. This patch works around that by closing some clients, allowing
> turnover of connections and unblocking the system. The downside is a small
> but theoretical window of data loss. This is likely better than locking
> up entirely though. Discussions with Peter are onging about how we could
> better fix this.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   .../pseudo/files/toomanyfiles.patch                | 62 ++++++++++++++++++++++
>   meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |  1 +
>   2 files changed, 63 insertions(+)
>   create mode 100644 meta/recipes-devtools/pseudo/files/toomanyfiles.patch
> 
> diff --git a/meta/recipes-devtools/pseudo/files/toomanyfiles.patch b/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
> new file mode 100644
> index 0000000..14a8975
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
> @@ -0,0 +1,62 @@
> +Currently if we max out the maximum number of files, pseudo can deadlock, unable to
> +accept new connections yet unable to move forward and unblock the other processes
> +waiting either.
> +
> +Rather than hang, when this happens, close out inactive connections, allowing us
> +to accept the new ones. The disconnected clients will simply reconnect. There is
> +a small risk of data loss here sadly but its better than hanging.
> +
> +RP
> +2017/4/25
> +
> +Upstream-Status: Pending [Peter is aware of the issue]
> +
> +Index: pseudo-1.8.2/pseudo_server.c
> +===================================================================
> +--- pseudo-1.8.2.orig/pseudo_server.c
> ++++ pseudo-1.8.2/pseudo_server.c
> +@@ -581,6 +581,7 @@ pseudo_server_loop(void) {
> + 	int rc;
> + 	int fd;
> + 	int loop_timeout = pseudo_server_timeout;
> ++	int hitmaxfiles;
> +
> + 	clients = malloc(16 * sizeof(*clients));
> +
> +@@ -597,6 +598,7 @@ pseudo_server_loop(void) {
> + 	active_clients = 1;
> + 	max_clients = 16;
> + 	highest_client = 0;
> ++	hitmaxfiles = 0;
> +
> + 	pseudo_debug(PDBGF_SERVER, "server loop started.\n");
> + 	if (listen_fd < 0) {
> +@@ -663,10 +665,18 @@ pseudo_server_loop(void) {
> + 						message_time.tv_usec -= 1000000;
> + 						++message_time.tv_sec;
> + 					}
> ++				} else if (hitmaxfiles) {
> ++					/* In theory there is a potential race here where if we close a client,
> ++					   it may have sent us a fastop message which we don't act upon.
> ++					   If we don't close a filehandle we'll loop indefinitely thought.
> ++					   Only close one per loop iteration in the interests of caution */
> ++					close_client(i);
> ++					histmaxfiles = 0;

Typo?  s/histmaxfiles/hitmaxfiles/

> + 				}
> + 				if (die_forcefully)
> + 					break;
> + 			}
> ++			hitmaxfiles = 0;
> + 			if (!die_forcefully &&
> + 			    (FD_ISSET(clients[0].fd, &events) ||
> + 			     FD_ISSET(clients[0].fd, &reads))) {
> +@@ -688,6 +698,9 @@ pseudo_server_loop(void) {
> +                                          */
> +                                         pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
> +                                         die_peacefully = 0;
> ++				} else if (errno == EMFILE) {
> ++					hitmaxfiles = 1;
> ++					pseudo_debug(PDBGF_SERVER, "Hit max open files, dropping a client.\n");
> + 				}
> + 			}
> + 			pseudo_debug(PDBGF_SERVER, "server loop complete [%d clients left]\n", active_clients);
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
> index b427b9a..9bcd031 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
> @@ -7,6 +7,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
>              file://moreretries.patch \
>              file://efe0be279901006f939cd357ccee47b651c786da.patch \
>              file://b6b68db896f9963558334aff7fca61adde4ec10f.patch \
> +           file://toomanyfiles.patch \
>              "
>   
>   SRC_URI[md5sum] = "7d41e72188fbea1f696c399c1a435675"
> 


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

