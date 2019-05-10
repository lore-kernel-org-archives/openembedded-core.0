Return-Path: <martin@geanix.com>
X-Greylist: delayed 545 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 May 2019 05:32:32 UTC
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 965077D584
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 05:32:32 +0000 (UTC)
Received: from [10.0.0.10] (unknown [85.184.147.232])
	by first.geanix.com (Postfix) with ESMTPSA id ECB07903;
	Fri, 10 May 2019 05:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1557465755; bh=9jQoTSSxNFfC1XDd9ky2vwU6HMJusyf9PRoJk/BInsY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ZMDDf3msuxo6TznEPFlfd2vPoH/AE/zvWKxjoIxPTEjYZuijqNFKE2Sf6mrMNnbsQ
	Iwk/H01zCOu63Eb1roAH2AxqFTb7FOv2sKO/6NhR6JURkY6LjwuD/DyxlvS3Peb/Fh
	AFbD1BkUxE3HA7JBIw5wYhxVa9sUz7W7EWZROp7ZU1PzPy8wqb79eOgp9Eh3IAuKJ3
	P/pQQz4hq8m+tyidKkK0HebrENqpss5fUB3tijo6ZLv20zMi+uYO4mt/ZqayrFnh4m
	GXJqdOraZ6B/kHh/7MC+5X0VaHYzOPTlO7KbTMEaeQuI+86K8ixJX7luGsKP6G4MDM
	jVs1bPojPDAVQ==
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
References: <20190509214007.13927-1-luca.boccassi@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <f2b0a420-ed6c-91e2-dd88-399169363349@geanix.com>
Date: Fri, 10 May 2019 07:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509214007.13927-1-luca.boccassi@gmail.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 9cf0eadf640b
Subject: Re: [PATCH] systemd: enable portabled by default and install utilities in systemd-container
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
X-List-Received-Date: Fri, 10 May 2019 05:32:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

Hi Luca,

On 09/05/2019 23.40, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> portable services have been declared production ready with v241, so enable
> by default and install the files in the container package.

The systemd portables feature is not really related to containers/VM's, 
so I think it should stay in the primary package; or alternatively in a 
separate package.

// Martin

> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>   meta/recipes-core/systemd/systemd_242.bb | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
> index 73e03c7a77..83b00ba785 100644
> --- a/meta/recipes-core/systemd/systemd_242.bb
> +++ b/meta/recipes-core/systemd/systemd_242.bb
> @@ -81,6 +81,7 @@ PACKAGECONFIG ??= " \
>       nss \
>       nss-mymachines \
>       nss-resolve \
> +    portabled \
>       quotacheck \
>       randomseed \
>       resolved \
> @@ -403,8 +404,10 @@ SYSTEMD_SERVICE_${PN}-remote = "systemd-journal-remote.socket"
>   
>   FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
>                            ${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf \
> +                         ${sysconfdir}/dbus-1/system.d/org.freedesktop.portable1.conf \
>                            ${sysconfdir}/systemd/system/multi-user.target.wants/machines.target \
>                            ${base_bindir}/machinectl \
> +                         ${base_bindir}/portablectl \
>                            ${bindir}/systemd-nspawn \
>                            ${nonarch_libdir}/systemd/import-pubring.gpg \
>                            ${systemd_system_unitdir}/busnames.target.wants/org.freedesktop.import1.busname \
> @@ -418,21 +421,28 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
>                            ${systemd_system_unitdir}/org.freedesktop.machine1.busname \
>                            ${systemd_system_unitdir}/systemd-importd.service \
>                            ${systemd_system_unitdir}/systemd-machined.service \
> +                         ${systemd_system_unitdir}/systemd-portabled.service \
>                            ${systemd_system_unitdir}/dbus-org.freedesktop.machine1.service \
> +                         ${systemd_system_unitdir}/dbus-org.freedesktop.portable1.service \
>                            ${systemd_system_unitdir}/var-lib-machines.mount \
>                            ${rootlibexecdir}/systemd/systemd-import \
>                            ${rootlibexecdir}/systemd/systemd-importd \
>                            ${rootlibexecdir}/systemd/systemd-machined \
> +                         ${rootlibexecdir}/systemd/systemd-portabled \
>                            ${rootlibexecdir}/systemd/systemd-pull \
> +                         ${exec_prefix}/lib/tmpfiles.d/portables.conf \
>                            ${exec_prefix}/lib/tmpfiles.d/systemd-nspawn.conf \
>                            ${systemd_system_unitdir}/systemd-nspawn@.service \
>                            ${libdir}/libnss_mymachines.so.2 \
>                            ${datadir}/dbus-1/system-services/org.freedesktop.import1.service \
>                            ${datadir}/dbus-1/system-services/org.freedesktop.machine1.service \
> +                         ${datadir}/dbus-1/system-services/org.freedesktop.portable1.service \
>                            ${datadir}/dbus-1/system.d/org.freedesktop.import1.conf \
>                            ${datadir}/dbus-1/system.d/org.freedesktop.machine1.conf \
> +                         ${datadir}/dbus-1/system.d/org.freedesktop.portable1.conf \
>                            ${datadir}/polkit-1/actions/org.freedesktop.import1.policy \
>                            ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
> +                         ${datadir}/polkit-1/actions/org.freedesktop.portable1.policy \
>                           "
>   
>   RRECOMMENDS_${PN}-container += "\
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix ApS
https://geanix.com
DK39600706

