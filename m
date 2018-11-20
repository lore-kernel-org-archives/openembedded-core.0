Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D986A6BA93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 17:39:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wAKHdpjR026238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 20 Nov 2018 17:39:52 GMT
Message-ID: <5dcfd0452f49d05cd969cc640924b82c91bd562a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 17:39:51 +0000
In-Reply-To: <20181119223308.47590-1-adrian.freihofer@gmail.com>
References: <20181119223308.47590-1-adrian.freihofer@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] systemd: fix PN-container package splitting
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
X-List-Received-Date: Tue, 20 Nov 2018 17:39:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-11-19 at 23:33 +0100, Adrian Freihofer wrote:
> From: Adrian Freihofer <adrian.freihofer@scs.ch>
> 
> - Fix package splitting for services installed with
>   systemd-container. Some files have been installed with systemd
>   package instead of systemd-container package. (*.service,
>   *.socket, *.html...)
> - Split journal-upload, journal-remote, journal-gatewayd into
>   separate packages. These services are not strictly related to
>   nspawn containers. Remote logging is now possible without
>   installing all the container stuff.
> - systemd-container package rdepends on the new packages to
>   maintain 100% backwards compatibility. But nspawn does not
>   really depend on them. rrecommends would be fine as well.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_239.bb | 56 ++++++++++++++++++++
> ----
>  1 file changed, 48 insertions(+), 8 deletions(-)

This causes failures in oe-selftest:


https://autobuilder.yoctoproject.org/typhoon/#/builders/28/builds/242/steps/7/logs/step2d

(you can run individual tests with oe-selftest -r <testname>

Cheers,

Richard


