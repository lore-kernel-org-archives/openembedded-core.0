Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7532E606D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 07:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2M7lsGi024993; Tue, 22 Mar 2016 07:47:54 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id waJSG2BGsRK9; Tue, 22 Mar 2016 07:47:54 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2M7lpuT024988
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 22 Mar 2016 07:47:53 GMT
Message-ID: <1458632871.20442.26.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org, Ross Burton
	<ross.burton@intel.com>
Date: Tue, 22 Mar 2016 07:47:51 +0000
In-Reply-To: <1458631473-22563-2-git-send-email-markus.lehtonen@linux.intel.com>
References: <1458631473-22563-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1458631473-22563-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Tue, 22 Mar 2016 07:48:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-03-22 at 09:24 +0200, Markus Lehtonen wrote:
> Make sure that we have a pristine source tree after do_unpack.
> 
> [YOCTO #9064]
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta/classes/base.bbclass | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 1372f38..aa107d4 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -133,23 +133,15 @@ python base_do_fetch() {
>  
>  addtask unpack after do_fetch
>  do_unpack[dirs] = "${WORKDIR}"
> +do_unpack[cleandirs] = "${@d.getVar('S', True) if d.getVar('S',
> True) != d.getVar('WORKDIR', True) else ''}"

Should this be else '${S}/patches'?

If we don't do that, there might be a case where we don't clean up the
patches directory when we could/should compared to the existing code?

Cheers,

Richard

