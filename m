Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id 90F197F963
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 08:58:52 +0000 (UTC)
Received: from [192.168.178.37] (i59F77ED2.versanet.de [89.247.126.210])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id 1557E11A044E;
	Fri, 25 Oct 2019 10:58:53 +0200 (CEST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<22cbc060-0f73-4354-1edb-ca90dbed4d73@herbrechtsmeier.net>
	<CANNYZj9L7O9a9RfyXpQP7kY2X_HNt5P9yJQCmUONeZq1rWDKwQ@mail.gmail.com>
	<541b19fa-54c4-42ce-0367-27ddd403d34f@herbrechtsmeier.net>
	<CANNYZj80r-WGgREdj=2TYC-uPNpTnWEL3mfZLtG53z-XR71bOQ@mail.gmail.com>
	<24e39481-ea5c-06e9-6dbb-139a5d0dd445@herbrechtsmeier.net>
	<CANNYZj8Q1q-EGaUSGFCvVe2A_f4YPvQJeSmrG69bGnokHqWL2Q@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <5fe554ed-ddb8-c733-2ec3-b00f178402b2@herbrechtsmeier.net>
Date: Fri, 25 Oct 2019 10:58:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8Q1q-EGaUSGFCvVe2A_f4YPvQJeSmrG69bGnokHqWL2Q@mail.gmail.com>
Cc: "Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Fri, 25 Oct 2019 08:58:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Am 24.10.19 um 19:58 schrieb Alexander Kanavin:
> On Thu, 24 Oct 2019 at 19:45, Stefan Herbrechtsmeier 
> <stefan@herbrechtsmeier.net <mailto:stefan@herbrechtsmeier.net>> wrote:
> 
>      > The package-lock.json in their tarball is 600K.
> 
>     The project use two major version and seven different versions with 30
>     installations of debug. Furthermore the dependencies include build
>     tools
>     which should not be installed on the device.
> 
>     The "@angular/cli" (242) and "node-red" (324) package share 106
>     packages.
> 
> 
> I have to ask: what point are you trying to make?

The both packages with different audience share between 44% and 33% of 
the packages. I think this true for other packages too.

> Here's a related lwn article describing a similar problem faced by opensuse:
> https://lwn.net/Articles/712318/

Unfortunately they also have no solution.

> ""Ruby dependency hell has nothing on JavaScript dependency hell," he 
> said. A "hello world" application based on one JavaScript framework has 
> 759 JavaScript dependencies; this framework is described as "a 
> lightweight alternative to Angular2".

Unfortunately they don't name the package nor give details about the 
dependencies. I assume they really count the dependencies with all there 
duplications and multiple minor or patch versions.


> There is no way he is going to 
> package all 759 dependencies for this thing; the current distribution 
> package-management approach just isn't going to work here."

What is the "current distribution package-management approach"? The 
manual creating of build configuration for every package or the 
automatic generation of recipes?

What is the alternative which fulfill the requirements of an embedded 
distribution?

My prototype automatically creates recipes from the packages. It only 
needs manual work if the package have no license file or a circular 
dependency.

The main problem is the pinning of specific versions inside the 
package.json and the increase of the major version if the support for a 
very old node.js version is removed.

The prototype assumes a compatible inside a major version and creates a 
recipe per major version. Thereby it always uses the latest version per 
major version. The recipe count could further optimized in a manual step 
which checks if there is really a breaking change between the major 
version. The number of this recipes is low in compare to the total count 
of recipes but the packages are often shared between different packages.

Regards
   Stefan

