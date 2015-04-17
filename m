Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 59C4271EC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 21:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3HLoFiK004005; Fri, 17 Apr 2015 22:50:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bnBT1sEmKOMT; Fri, 17 Apr 2015 22:50:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3HLo2nC004000
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 17 Apr 2015 22:50:14 +0100
Message-ID: <1429307402.6976.207.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Fri, 17 Apr 2015 22:50:02 +0100
In-Reply-To: <1ca6d1e0276189ecb640f08ce5afee34a788c163.1429177203.git.alejandro.hernandez@linux.intel.com>
References: <cover.1429177203.git.alejandro.hernandez@linux.intel.com>
	<1ca6d1e0276189ecb640f08ce5afee34a788c163.1429177203.git.alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] python3-native: Fix pip install issue due to unclean build directory
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
X-List-Received-Date: Fri, 17 Apr 2015 21:50:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-04-16 at 09:45 +0000, Alejandro Hernandez wrote:
> When installing python3-native sometimes pips default build
> directory (which is on the host and is user dependant) is left unclean,
> due to this, when python3-core is being installed it tries to use
> the same directory producing an error, this explicitly removes
> what the previous installation might have left behind, fixing the issue.
> 
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  .../python/python3-native_3.4.2.bb                 |  1 +
>  .../python3/pip_build_directory_unclean.patch      | 28 ++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch

The problem here is that two builds of python3-native could be happening
on the same system at the same time. In fact I'd bet that is why its
breaking on the autobuilder. Can we not tell it to use something in
WORKDIR as its temp directory instead?

Cheers,

Richard


