Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6lEe-0000M2-2K
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 17:30:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8MFPPUk017531
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 08:25:27 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 22 Sep 2011 08:25:26 -0700
Message-ID: <4E7B5365.1040400@windriver.com>
Date: Thu, 22 Sep 2011 10:25:25 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1316655855.git.mark.hatle@windriver.com>
	<8d17a7e67c22daca0d60fe77619283d9bdd31bb2.1316655855.git.mark.hatle@windriver.com>
	<1316665014.13622.8.camel@ted>
In-Reply-To: <1316665014.13622.8.camel@ted>
Subject: Re: [PATCH 3/6] foomatic-filters: Disable filter checking
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
X-List-Received-Date: Thu, 22 Sep 2011 15:30:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/21/11 11:16 PM, Richard Purdie wrote:
> On Wed, 2011-09-21 at 20:47 -0500, Mark Hatle wrote:
>> Disable a few checks, and hard code the values for a few other items
>> to work around potential host contamination issues.  We also default
>> to the cups configuration for items.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  .../foomatic/foomatic-filters_4.0.7.bb             |   21 ++++++++++++++-----
>>  1 files changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
>> index 9627187..856f5ac 100644
>> --- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
>> +++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
>> @@ -10,7 +10,7 @@ format using a printer-specific, but spooler-independent PPD file. \
>>  "
>>  
>>  DEPENDS += "cups perl libxml2"
>> -PR = "r1"
>> +PR = "r2"
>>  
>>  LICENSE = "GPLv2+"
>>  LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
>> @@ -20,11 +20,20 @@ SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.
>>  SRC_URI[md5sum] = "20abd25c1c98b2dae68709062a132a7d"
>>  SRC_URI[sha256sum] = "090313fae40b177f505d9c9b93d7a4d7188b6d5d18b6ae41ab24903ac983478d"
>>  
>> -do_install_append_linuxstdbase() {
>> -    install -d ${D}${libdir}/cups/filter
>> -    ln -sf ${bindir}/foomatic-rip ${D}${libdir}/cups/filter
>> +inherit autotools
>> +
>> +EXTRA_OECONF += "--disable-file-converter-check --with-file-converter=texttops"
>> +
>> +do_configure_prepend() {
>> +    export LIB_CUPS=/usr/lib/cups               # /usr/lib NOT libdir
>> +    export CUPS_BACKENDS=/usr/lib/cups/backend  # /usr/lib NOT libdir
>> +    export CUPS_FILTERS=/usr/lib/cups/filter    # /usr/lib NOT libdir
>> +    export CUPS_PPDS=%{_datadir}/cups/model
>>  }
>>  
>> -FILES_${PN}_append_linuxstdbase += "${libdir}/cups/filter/foomatic-rip"
>> +do_install_append_linuxstdbase() {
>> +    install -d ${D}/usr/lib/cups/filter
>> +    ln -sf ${bindir}/foomatic-rip ${D}/usr/lib/cups/filter
>> +}
>>  
>> -inherit autotools
>> +FILES_${PN}_append_linuxstdbase += "/usr/lib/cups/filter/foomatic-rip"
> 
> This needs a little more explaintion. What happens for the micro (or
> minimal, I forget which) distro where they don't have /usr/ ?
> 
> I suspect you mean to use ${exec_prefix}/lib above...

These are items that, as far as I know, are only useful with cups and a "full
system" configuration.  CUPS is hard coded to use "/usr/lib" for these files.
Previously the configure was loading values from the host system which may or
may not match our CUPS configuration.

If both cups and foomatic-filters need to work in an environment where /usr may
not be present, we'll need to adjust both for that.

--Mark

> Cheers,
> 
> Richard
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



