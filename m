Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 416B77F859
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 20:44:18 +0000 (UTC)
Received: from Marks-MacBook-Pro.local ([76.164.61.198]) (authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id x9NKi8vB021685
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Wed, 23 Oct 2019 15:44:09 -0500
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>,
	openembedded-core@lists.openembedded.org
References: <20191023202511.DBC8D440DCF_DB0B727B@spamalot.elettra.eu>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <2d2d7e60-d79e-5540-1378-88fda1fab4ec@kernel.crashing.org>
Date: Wed, 23 Oct 2019 15:44:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191023202511.DBC8D440DCF_DB0B727B@spamalot.elettra.eu>
Subject: Re: [PATCH] systemtap: support usrmerge
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
X-List-Received-Date: Wed, 23 Oct 2019 20:44:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/23/19 3:25 PM, Alessio Igor Bogani wrote:
> Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
> ---
>  meta/recipes-kernel/systemtap/systemtap_git.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
> index 6ee3e1c0f7..2efba2e06f 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -52,10 +52,13 @@ do_install_append () {
>     fi
>  
>     # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
> -   install -d `dirname ${D}${systemd_unitdir}`
> -   mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
> +   if not ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
> +      install -d `dirname ${D}${systemd_unitdir}`
> +      mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
> +   fi
>     rmdir ${D}${prefix}/lib --ignore-fail-on-non-empty

A better check out be:

if [ {D}${prefix}/lib/systemd != `dirname ${D}${systemd_unitdir}` ]; then
   install -d `dirname ${D}${systemd_unitdir}`
   mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
   rmdir ${D}${prefix}/lib --ignore-fail-on-non-empty
fi

This way the issue is resolved even if usrmerge isn't enabled, but the user
manually manipulated the paths.
> +
>     # Ensure correct ownership for files copied in
>     chown root:root ${D}${sysconfdir}/stap-exporter/* -R
>  }
> 

