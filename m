Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QUnyP-0006YW-FR
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 00:45:09 +0200
Received: from mail-pv0-f180.google.com ([74.125.83.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 09 Jun 2011 15:40:43 -0700
Received: by pvc21 with SMTP id 21so925012pvc.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 15:40:43 -0700 (PDT)
Received: by 10.142.248.4 with SMTP id v4mr270284wfh.145.1307659243554;
	Thu, 09 Jun 2011 15:40:43 -0700 (PDT)
Received: from [10.6.18.206] (c-71-193-189-117.hsd1.wa.comcast.net
	[71.193.189.117])
	by mx.google.com with ESMTPS id x16sm2161318wfc.22.2011.06.09.15.40.42
	(version=SSLv3 cipher=OTHER); Thu, 09 Jun 2011 15:40:43 -0700 (PDT)
Message-ID: <4DF14BE9.7080704@intel.com>
Date: Thu, 09 Jun 2011 15:40:41 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: wenzong fan <wenzong.fan@windriver.com>
References: <4DE850E8.2050701@windriver.com>
In-Reply-To: <4DE850E8.2050701@windriver.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Yocto] The design document for ccache-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jun 2011 22:45:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2011 08:11 PM, wenzong fan wrote:
> Hi Folks,
>
> Please help me to review the design document for ccache-native, and
> I also have two questions about it, any answers or suggestions are
> appreciated.
>
> * Feature name: ccache-native
>     Priority: P3; M2
>     Owner: Wenzong Fan
>     Summary: Integrate ccache-native to yocto
>
> * Description:
> Bitbake supports the 'CCACHE Mechanism', but 'ccache' hasn't been
> included by poky/yocto, just add it as a native tool.
>
> * Usage:
> Build ccache as a native tool by default and enable it for speeding
> target packages build.
>
> * Implementation:
> 1) Copy bb file from OE upstream to:
>       meta/recipes-devtools/ccache/
>
> 2) Update bb file to get the latest ccache_3.1.5 and split the single
> bb file to:
>       'ccache_3.1.5.bb', 'ccache.inc'
>
> 3) Enable ccache in the native tools building.
>
You will need to have it be a dependency pretty early on in the build.
Additionally, this is a bit a new part to this task, we want to have the 
default CCACHE_DIR for the build default to a directory in TMPDIR 
instead of the user's home directory.  This will mean setting an 
environment variable somewhere early also.


> * Questions:
> 1) Do we want to add it as a target package? And which images should
> include it?
Yes, it should be included as part of any SDK image, to do this you 
would add it to the task-core-sdk list.

> 2) How to add it into native tools build list and build it by default?
>
You use BBCLASSEXTEND = "native" in the recipe, that will give you the 
native for free.

>
> Thanks
> Wenzong
>



