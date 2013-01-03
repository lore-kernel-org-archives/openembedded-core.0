Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TqqaX-0007UZ-Ha
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 20:36:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r03JLKRa016158
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jan 2013 11:21:20 -0800 (PST)
Received: from msp-dhcp10.wrs.com (172.25.34.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 3 Jan 2013 11:21:20 -0800
Message-ID: <50E5DA36.5090702@windriver.com>
Date: Thu, 3 Jan 2013 13:21:26 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <50E5D101.9030701@balister.org>
In-Reply-To: <50E5D101.9030701@balister.org>
Subject: Re: Enabling NEON instructions for fftw
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jan 2013 19:36:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/13 12:42 PM, Philip Balister wrote:
> So, recent versions of fftw have NEON support for the single precision
> build. In the poast, I just passed --enable-neon to configure or the
> armv7a case. Now, this is not entirely correct, since some armv7a's lack
> a NEON coprocessor.
>
> Does anyone have a suggestion for how to handle this better? Personally,
> I think if you want to run fftwf without NEON, you should have your head
> examined, but I would like to avoid generating packages that SIGILL on
> people.

This says to me that either you need a machine specific package, or use an 
alternative architecture for that package.. (that is compatible).. then the 
package can switch neon on/off depending on arch of tuning flags.

There is an armv7a-neon tuning defined.  This enabled the TUNE_FEATURES of 
'neon'.  So you should be able to check for that in the fftw recipe, and enable 
the --enable-neon when it's set.  (Using PACKAGECONFIG is likely best...)

Then you can change the DEFAULTTUNE_<recipe> = "armv7-neon" in your local.conf.

--Mark

> Philip
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



