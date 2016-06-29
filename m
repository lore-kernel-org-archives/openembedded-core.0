Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8776010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 09:29:32 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1bIBoL-0004g6-Du; Wed, 29 Jun 2016 11:29:33 +0200
To: Armin Kuster <akuster@mvista.com>
References: <1461516768-29868-1-git-send-email-raj.khem@gmail.com>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <47b17632-bc9a-64a2-b9a2-0fb75e9bdcde@pengutronix.de>
Date: Wed, 29 Jun 2016 11:29:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1461516768-29868-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: [krogoth] systemd: Create missing sysusers offline
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
X-List-Received-Date: Wed, 29 Jun 2016 09:29:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

this patch is required, for example, to successfully build systemd with 
networkd enabled in krogoth release, too. Thus it should be backported.

It is in oe-core master, id d18957925c6c073b7194e3a233efea24e436f74e.

Best regards, Enrico

On 04/24/2016 06:52 PM, Khem Raj wrote:
> Some system users which are needed by systemd components were missing
> create these users knobbed with relevant packageconfig
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changes from v1->v2:
>  -Create systemd-journal-remote
>  -Create systemd-journal-upload
>
>  meta/recipes-core/systemd/systemd_229.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
> index c23c749..cf34921 100644
> --- a/meta/recipes-core/systemd/systemd_229.bb
> +++ b/meta/recipes-core/systemd/systemd_229.bb
> @@ -319,10 +319,16 @@ PACKAGES =+ "\
>  SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfmt', '', d)}"
>  SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
>
> -USERADD_PACKAGES = "${PN}"
> +USERADD_PACKAGES = "${PN} ${PN}-extra-utils"
>  USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
> +USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-remote;', '', d)}"
> +USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '--system -d / -M --shell /bin/nologin systemd-journal-upload;', '', d)}"
>  USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
> +USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
> +USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
> +USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
>  GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
> +USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy"
>
>  FILES_${PN}-analyze = "${bindir}/systemd-analyze"
>
>

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


