Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SF8E8-0000HY-JD
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 20:13:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q33I3wV7017925
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 11:03:58 -0700 (PDT)
Received: from msp-dhcp14.wrs.com (172.25.34.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 3 Apr 2012 11:03:57 -0700
Message-ID: <4F7B3B8C.6000200@windriver.com>
Date: Tue, 3 Apr 2012 13:03:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F7B38C7.6010909@mlbassoc.com>
In-Reply-To: <4F7B38C7.6010909@mlbassoc.com>
Subject: Re: Schizophrenic package management
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
X-List-Received-Date: Tue, 03 Apr 2012 18:13:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/12 12:52 PM, Gary Thomas wrote:
> Why are both opkg-native and rpm-native needed to build images?
> When I asked this previously, I was told that rpm was used because
> it has superior dependency tracking.  Fair enough (I guess), but
> then why is opkg required if I build an image using
>     PACKAGE_CLASSES = "package_rpm"
>

rpm-native is used for internal dependency scanning.  The exact tool is 
"rpmdeps".  These dependencies may or may not be rolled up into package level 
dependencies by the packaging tool (which may be opkg, deb or rpm).  (see 
package.bbclass)

opkg-native is used for handling alternatives and similar during packaging and 
image creation.  So it's also needed.

I don't believe opkg, or rpm are needed on the target image though, unless of 
course you select one of them as the packaging type and you want target package 
management.

--Mark


