Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B600274197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:43:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7VJhS0F019749
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Aug 2015 12:43:28 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Mon, 31 Aug 2015 12:43:28 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
	<CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
	<CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
	<CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
	<55E4940B.5050105@windriver.com>
	<CAMKF1sqSTenmfkQst644-c0yGHmheSE0APwOR7cHK_5-T_d4mQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <55E4AE5F.9080804@windriver.com>
Date: Mon, 31 Aug 2015 14:43:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqSTenmfkQst644-c0yGHmheSE0APwOR7cHK_5-T_d4mQ@mail.gmail.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Mon, 31 Aug 2015 19:43:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 8/31/15 2:20 PM, Khem Raj wrote:
> On Mon, Aug 31, 2015 at 10:51 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>
>> The way the recipe 'LICENSE =' field was defined, AFAIK, was that it was the
>> license of the source used to construct the binaries.
>>
>> So if the autoconf was GPLv3, but the package and it's sources are GPLv2+, it
>> would be listed as GPLv2+.
>>
>> Making this assumption allows us to be confident that the general license of
>> recipe matches the binaries constructed by the recipe, allowing LICENSE-${PN} =
>> ${LICENSE} in the general case.
>>
> 
> it seems in your view the build system or generator files are
> excluded. Which we can not say untill and until the generator files
> say that explicitly like the autoconf exception.  In my understanding
> the build scripts and files also form the part of compilatiion
> process.

My interpretation of many licenses is that the build system does not get
compiled into the binary.  Thus the binary does not get impacted by the build
system's license.

That isn't to say that autoconf isn't GPLv3, just that it doesn't contaminate
the binaries in question, under normal usage.  (If a build component, or the
output of a component WERE to influence the license of the produced executable
-- then I would expect it to be listed in the LICENSE field....)

If every package that included autoconf now had to have GPLv3 listed in it, I
think this would diminish the usefulness of the LICENSE field.  This would
effectively confuse the developers into thinking that suddenly -everything-
autoconf is now GPLv3, even though it isn't in my opinion.

The majority of the developers in my experience really don't care about source
code license -- they care about the license of the binaries in their deployed
products.  (The license of the binaries over source is an important distinction.
 I ship binaries to my customers, as such I'm required to full fill the
obligations of the software license to those binaries.  Many open sources
license require you to redistribute the corresponding sources with the binaries,
and some have been interpreted to say you need to include the instructions for
building them as well.)

Declaring the licenses based on the source code used to produce the output is
the standard way of handling this from my experiences.  This matches the way
Debian and other distributions recognized sources and have dealt with the
license fields in their distributions, such as Debian, Fedora, etc.  I think
it's a pretty major change to start including the license of all files in a
source archive in the recipe.  (Especially if the files are never distributed
except as part of the 'original source code' for a program.)

If that is the way we want to move forward, then my recommendation would be to
add a new field for that.

LICENSE-SRC = "source license list"
LICENSE = "declared license for the expected output of the build"
LICENSE_<package> = "The license for the items in this specific package"

Where:

 LICENSE ?= "${LICENSE-SRC}"

 LICENSE_<package> ?= "${LICENSE}"

I see a lot of potential work here, but I don't see the benefit though.

I don't know of any cases where someone has gotten in trouble, or even
questioned, when the build system has a slightly different license then output
of the build.  The GNU build tools are definitely the biggest example I can give
here.

>> This does certainly put in an interesting situation though if there is an
>> obscure license where the binaries and sources are effectively under different
>> restrictions.  (Perhaps if a build environment contained a license that required
>> an advertising clause, but the produced binaries did not include it.  The
>> obligation to advertise or not could be up for some debate by a lawyer, even
>> though the source code may need to be redistributed.)
> 
> We may not treat build system differently than other sources of component.

Here I disagree.  I think as long as the build system doesn't change the license
of the resulting binaries in anyway, and the build system doesn't have a license
that conflicts with the resulting binaries, then we can certainly treat the
results differently.

(I'm not a lawyer, and frankly this is getting into the position where a lawyer,
if one were inclined, should be consulted for advice.)

As usual the goal here is to give the technical people the information they need
to have a reasonable chance of being compliant with the license requirements of
the binaries/systems/devices they are creating -- as well as giving them at
least some assistance in being a 'good' open source citizen to be able to
redistribute the sources for the Open Source components they have used.)

>>
>> Do you know of any cases where this may be true or where end users may have
>> concerns that a license is not properly represented?
> 
> proprietary components based on some external build systems may be
> 


