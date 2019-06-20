Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F14B27E7DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 08:45:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5K8jLS8027676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jun 2019 01:45:37 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 20 Jun 2019 01:45:24 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
	<b7589dd06670ead7a2ca7e8c7301b289e2543249.1561018476.git.liezhi.yang@windriver.com>
	<20190620082858.GC27107@localhost>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <07882a06-4c45-07aa-9696-8de4f86b8c0b@windriver.com>
Date: Thu, 20 Jun 2019 16:46:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190620082858.GC27107@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gtk-icon-cache.bbclass: Depends on gtk+3
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
X-List-Received-Date: Thu, 20 Jun 2019 08:45:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/20/19 4:28 PM, Adrian Bunk wrote:
> On Thu, Jun 20, 2019 at 04:15:26PM +0800, Robert Yang wrote:
>> The gtk-update-icon-cache and gdk-pixbuf-query-loaders are provided by gtk+3.
> 
> gdk-pixbuf-query-loaders is provided by gdk-pixbuf,
> which is not tied to a specific GTK version.
> 
> gtk-update-icon-cache is provided by both GTK 2 and GTK 3,
> I haven't checked whether it will also be in GTK 4.

Thanks, I will update it.

> 
>> ...
>> --- a/meta/classes/gtk-icon-cache.bbclass
>> +++ b/meta/classes/gtk-icon-cache.bbclass
>> @@ -4,6 +4,11 @@ DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk
>>   
>>   PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
>>   
>> +inherit distro_features_check
>> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>> +
>> +DEPENDS += "gtk+3"
>> ...
> 
> This looks OK.
> 
>> @@ -45,10 +50,11 @@ python populate_packages_append () {
>>           if not os.path.exists(icon_dir):
>>               continue
>>   
>> -        bb.note("adding hicolor-icon-theme dependency to %s" % pkg)
>> -        rdepends = ' ' + d.getVar('MLPREFIX', False) + "hicolor-icon-theme"
>> -        d.appendVar('RDEPENDS_%s' % pkg, rdepends)
>> -
>> +        for dep in ('hicolor-icon-theme', 'gtk+3'):
>> +            bb.note("Adding %s dependency to %s" % (dep, pkg))
>> +            rdepends = ' ' + d.getVar('MLPREFIX', False) + dep
>> +            d.appendVar('RDEPENDS_%s' % pkg, rdepends)
>> ...
> 
> Why is this necessary?

Otherwise, gtk+3 won't be installed.

> 
> I would expect there to always be a generated RDEPENDS on either
> gtk+ or gtk+3 (or soon gtk4) that already covers this.
> Anything I miss here?

gtk2/3/4 is a problem, I checked DEPENDS in oe-core's recipes, most
of them depend on gtk+3, only one depends on gtk+:

meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb

Maybe gtk+2 is out of date? Since gtk+4 is on the way, so I think that we
need something like virtual/gtk to fix these problems totally?

// Robert

> 
> cu
> Adrian
> 

