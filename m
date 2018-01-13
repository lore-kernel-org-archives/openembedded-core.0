Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DF63C78694
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jan 2018 14:14:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0DEEutr024376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 13 Jan 2018 14:14:58 GMT
Message-ID: <1515852896.29722.157.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <jslater@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 13 Jan 2018 14:14:56 +0000
In-Reply-To: <20171219190728.133823-1-jslater@windriver.com>
References: <20171219190728.133823-1-jslater@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] testsdk: add ability to search for multilib packages
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
X-List-Received-Date: Sat, 13 Jan 2018 14:14:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-12-19 at 11:07 -0800, Joe Slater wrote:
> We search for packages related to the sdk environment
> being used for a test.

[...]
> @@ -33,6 +34,16 @@ class OESDKTestContext(OETestContextThreaded):
>      def hasTargetPackage(self, pkg):
>          return self._hasPackage(self.target_pkg_manifest, pkg)
>  
> +    def hasPrefixedTargetPackage(self, pkg):
> +        # extract multilib from environment script name
> +        try:
> +            p = re.match(".*(lib.?[36][24]-)linux-?",
> self.sdk_env).group(1) + pkg
> +        except:

I'm not sure this is correct, many of the prefixes are just "lib32-"
and there is no "linux" in there?

We could really use unit tests on these functions as we're heading into
unmaintainable spaghetti territory :(.

It may also be an option to iterate the configured multilibs and search
for each one, that way we avoid the regexp overhead?

Cheers,

Richard

