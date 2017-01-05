Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8D32C60111
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 09:35:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Jan 2017 01:35:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="1079452689"
Received: from mjtierna-mobl4.ger.corp.intel.com (HELO [10.252.21.200])
	([10.252.21.200])
	by orsmga001.jf.intel.com with ESMTP; 05 Jan 2017 01:35:48 -0800
User-Agent: Microsoft-MacOutlook/14.7.1.161129
Date: Thu, 05 Jan 2017 11:35:54 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <D493DC33.6E785%markus.lehtonen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 7/8] oeqa.utils.metadata: have layer name as an
	attribute in xml
References: <1482930164-15721-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1482930164-15721-8-git-send-email-markus.lehtonen@linux.intel.com>
	<23139570-1257-66eb-482c-e2f438a11976@linux.intel.com>
In-Reply-To: <23139570-1257-66eb-482c-e2f438a11976@linux.intel.com>
Mime-version: 1.0
Subject: Re: [PATCH 7/8] oeqa.utils.metadata: have layer name as an attribute in xml
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
X-List-Received-Date: Thu, 05 Jan 2017 09:35:57 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 04/01/2017, 17.43, "Mariano Lopez" <mariano.lopez@linux.intel.com>
wrote:
>
>On 28/12/16 07:02, Markus Lehtonen wrote:
>> -def dict_to_XML(tag, dictionary):
>> +def dict_to_XML(tag, dictionary, **kwargs):
>>      """ Return XML element converting dicts recursively. """
>>  
>> -    elem = Element(tag)
>> +    elem = Element(tag, **kwargs)
>>      for key, val in dictionary.items():
>> -        if isinstance(val, MutableMapping):
>> +        if tag == 'layers':
>> +            child = (dict_to_XML('layer', val, name=key))
>> +        elif isinstance(val, MutableMapping):
>>              child = (dict_to_XML(key, val))
>>          else:
>>              child = Element(key)
>
>I was thinking that this function would be more generic, adding a
>comparison to a tag name surely won't keep the function generic, is
>there another way to implement this keeping this function generic enough?

I don't think it's possible to make a nice generic json to xml converter.
The formats are just so different. I think the current method just
generates bad xml. In the future, it would probably be better to just get
rid of the json-to-xml conversion completely and make metadata_from_bb()
to directly return an ElementTree.

Thanks, 
  Markus



