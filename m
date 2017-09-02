Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 887C7782DD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Sep 2017 11:46:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v82BkSRI017643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 2 Sep 2017 12:46:30 +0100
Message-ID: <1504352788.2175.73.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Alarcon <jose.alarcon@ge.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 02 Sep 2017 12:46:28 +0100
In-Reply-To: <20170826112602.15344-2-jose.alarcon@ge.com>
References: <20170826112602.15344-1-jose.alarcon@ge.com>
	<20170826112602.15344-2-jose.alarcon@ge.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sat, 02 Sep 2017 12:46:30 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] rootfs-postcommands: add test for unsatisfied RRECOMMENDS
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
X-List-Received-Date: Sat, 02 Sep 2017 11:46:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2017-08-26 at 14:26 +0300, Jose Alarcon wrote:
> The do_rootfs log contains a number of unsatisfied package
> recommendations. At the moment those are only visible when
> reviewing the rootfs log.
> 
> This patch adds an extra check to surface any unsatisfied
> recommendation  as WARNINGS to the build output when
> "debug-tweaks" is enabled.
> 
> Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> index fb36bad..e7ef382 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -50,6 +50,9 @@ python () {
>      d.appendVar('ROOTFS_POSTPROCESS_COMMAND',
> '${SORT_PASSWD_POSTPROCESS_COMMAND}')
>  }
>  
> +# Enable QA check for unsatisfied recommendations if debug-tweaks is
> enabled
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATU
> RES", "debug-tweaks", "rootfs_log_check_recommends; ", "",d)}'
> +
>  systemd_create_users () {
>  	for conffile in
> ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf
> ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
>  		[ -e $conffile ] || continue

Can we just drop the above piece please? I think its fine for the user
to enable this with:

ROOTFS_POSTPROCESS_COMMAND += "rootfs_log_check_recommends"

We're trying to kill off debug-tweaks as nobody can tell what it does
from the name.

Cheers,

Richard

> @@ -307,3 +310,15 @@ python write_image_test_data() {
>             os.remove(testdata_link)
>          os.symlink(os.path.basename(testdata), testdata_link)
>  }
> +
> +# Check for unsatisfied recommendations (RRECOMMENDS)
> +python rootfs_log_check_recommends() {
> +    log_path = d.expand("${T}/log.do_rootfs")
> +    with open(log_path, 'r') as log:
> +        for line in log:
> +            if 'log_check' in line:
> +                continue
> +
> +            if 'unsatisfied recommendation for' in line:
> +                bb.warn('[log_check] %s: %s' % (d.getVar('PN',
> True), line))
> +}
> -- 
> 2.10.1
> 

