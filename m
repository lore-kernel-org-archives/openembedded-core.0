Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 10B8E60119
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 14:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NEbxX4024672; Fri, 23 Sep 2016 15:37:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XqIgz248afZb; Fri, 23 Sep 2016 15:37:59 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NEbt0r024668
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 23 Sep 2016 15:37:56 +0100
Message-ID: <1474641475.7207.370.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 15:37:55 +0100
In-Reply-To: <b837a1b7714ef69601f5a12cbf5baf925dfb1a7b.1474619360.git.Qi.Chen@windriver.com>
References: <cover.1474619360.git.Qi.Chen@windriver.com>
	<b837a1b7714ef69601f5a12cbf5baf925dfb1a7b.1474619360.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] toolchain-script: use immediate expansion for TOOLCHAIN_CONFIGSITE_NOCACHE
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
X-List-Received-Date: Fri, 23 Sep 2016 14:38:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-09-23 at 16:30 +0800, Chen Qi wrote:
> Use immediate expansion for the assignment to avoid other classes
> modifying
> variables like HOST_ARCH which changes the result. This happens in
> the
> meta-environment recipe. It inherits cross-canadian which changes
> HOST_ARCH
> from TARGET_ARCH to SDK_ARCH, resulting in wrong site config files in
> the
> generated SDK.
> 
> [YOCTO #10255]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/toolchain-scripts.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've not merged this as yet since I worry that this is something we'd
easily break again. It all depends which order classes are included and
moving the cross-canadian inherit in meta-environment would break this
even with immediate expansion.

I think the best way to fix this might be to change the meta-
environment to add:

# Need to expand here before cross-candian changes HOST_ARCH -> SDK_ARCH
TOOLCHAIN_CONFIGSITE_NOCACHE := "${TOOLCHAIN_CONFIGSITE_NOCACHE}"

before it inherits cross-candian, then the problem is explicitly
recorded and worked around.

Cheers,

Richard

