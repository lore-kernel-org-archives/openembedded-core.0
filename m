Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CBCE7FA84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 15:05:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9PF5Ogi011113
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Oct 2019 08:05:24 -0700 (PDT)
Received: from [128.224.56.205] (128.224.56.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 25 Oct 2019 08:05:24 -0700
To: akuster808 <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20191025122212.25687-1-trevor.gamblin@windriver.com>
	<cf553688-0f48-33ae-8c4c-18c7c34a5971@gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <370152d1-d96f-8863-4746-999422d85721@windriver.com>
Date: Fri, 25 Oct 2019 11:05:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cf553688-0f48-33ae-8c4c-18c7c34a5971@gmail.com>
Subject: Re: [zeus][PATCH v3] binutils: fix CVE-2019-17450
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
X-List-Received-Date: Fri, 25 Oct 2019 15:05:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 10/25/19 11:02 AM, akuster808 wrote:

>
> On 10/25/19 5:22 AM, Trevor Gamblin wrote:
>> Backport upstream fix to zeus.
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> Does this affect Master?
>
> - armin
>> ---
>>   .../binutils/binutils-2.32.inc                |  1 +
>>   .../binutils/binutils/CVE-2019-17450.patch    | 99 +++++++++++++++++++
>>   2 files changed, 100 insertions(+)
>>   create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
>> index 19baf8a883..1e96cf494d 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.32.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
>> @@ -49,6 +49,7 @@ SRC_URI = "\
>>        file://CVE-2019-12972.patch \
>>        file://CVE-2019-14250.patch \
>>        file://CVE-2019-14444.patch \
>> +     file://CVE-2019-17450.patch \
>>   "
>>   S  = "${WORKDIR}/git"
>>   
>> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
>> new file mode 100644
>> index 0000000000..a6ce0b9a8a
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
>> @@ -0,0 +1,99 @@
>> +From 09dd135df9ebc7a4b640537e23e26a03a288a789 Mon Sep 17 00:00:00 2001
>> +From: Alan Modra <amodra@gmail.com>
>> +Date: Wed, 9 Oct 2019 00:07:29 +1030
>> +Subject: [PATCH] PR25078, stack overflow in function find_abstract_instance
>> +
>> +Selectively backporting fix for bfd/dwarf2.c, but not the ChangeLog
>> +file. There are newer versions of binutils, but none of them contain the
>> +commit fixing CVE-2019-17450, so backport it to master and zeus.
>> +
>> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=063c511bd79]
>> +CVE: CVE-2019-17450
>> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> +
>> +	PR 25078
>> +	* dwarf2.c (find_abstract_instance): Delete orig_info_ptr, add
>> +	recur_count.  Error on recur_count reaching 100 rather than
>> +	info_ptr matching orig_info_ptr.  Adjust calls.
>> +
>> +---
>> + bfd/dwarf2.c | 35 +++++++++++++++++------------------
>> + 1 file changed, 17 insertions(+), 18 deletions(-)
>> +
>> +diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
>> +index 0b4e485582..20ec9e2e56 100644
>> +--- a/bfd/dwarf2.c
>> ++++ b/bfd/dwarf2.c
>> +@@ -2803,13 +2803,13 @@ lookup_symbol_in_variable_table (struct comp_unit *unit,
>> + }
>> +
>> + static bfd_boolean
>> +-find_abstract_instance (struct comp_unit *   unit,
>> +-			bfd_byte *           orig_info_ptr,
>> +-			struct attribute *   attr_ptr,
>> +-			const char **        pname,
>> +-			bfd_boolean *        is_linkage,
>> +-			char **              filename_ptr,
>> +-			int *                linenumber_ptr)
>> ++find_abstract_instance (struct comp_unit *unit,
>> ++			struct attribute *attr_ptr,
>> ++			unsigned int recur_count,
>> ++			const char **pname,
>> ++			bfd_boolean *is_linkage,
>> ++			char **filename_ptr,
>> ++			int *linenumber_ptr)
>> + {
>> +   bfd *abfd = unit->abfd;
>> +   bfd_byte *info_ptr;
>> +@@ -2820,6 +2820,14 @@ find_abstract_instance (struct comp_unit *   unit,
>> +   struct attribute attr;
>> +   const char *name = NULL;
>> +
>> ++  if (recur_count == 100)
>> ++    {
>> ++      _bfd_error_handler
>> ++	(_("DWARF error: abstract instance recursion detected"));
>> ++      bfd_set_error (bfd_error_bad_value);
>> ++      return FALSE;
>> ++    }
>> ++
>> +   /* DW_FORM_ref_addr can reference an entry in a different CU. It
>> +      is an offset from the .debug_info section, not the current CU.  */
>> +   if (attr_ptr->form == DW_FORM_ref_addr)
>> +@@ -2939,15 +2947,6 @@ find_abstract_instance (struct comp_unit *   unit,
>> + 					 info_ptr, info_ptr_end);
>> + 	      if (info_ptr == NULL)
>> + 		break;
>> +-	      /* It doesn't ever make sense for DW_AT_specification to
>> +-		 refer to the same DIE.  Stop simple recursion.  */
>> +-	      if (info_ptr == orig_info_ptr)
>> +-		{
>> +-		  _bfd_error_handler
>> +-		    (_("DWARF error: abstract instance recursion detected"));
>> +-		  bfd_set_error (bfd_error_bad_value);
>> +-		  return FALSE;
>> +-		}
>> + 	      switch (attr.name)
>> + 		{
>> + 		case DW_AT_name:
>> +@@ -2961,7 +2960,7 @@ find_abstract_instance (struct comp_unit *   unit,
>> + 		    }
>> + 		  break;
>> + 		case DW_AT_specification:
>> +-		  if (!find_abstract_instance (unit, info_ptr, &attr,
>> ++		  if (!find_abstract_instance (unit, &attr, recur_count + 1,
>> + 					       &name, is_linkage,
>> + 					       filename_ptr, linenumber_ptr))
>> + 		    return FALSE;
>> +@@ -3175,7 +3174,7 @@ scan_unit_for_symbols (struct comp_unit *unit)
>> +
>> + 		case DW_AT_abstract_origin:
>> + 		case DW_AT_specification:
>> +-		  if (!find_abstract_instance (unit, info_ptr, &attr,
>> ++		  if (!find_abstract_instance (unit, &attr, 0,
>> + 					       &func->name,
>> + 					       &func->is_linkage,
>> + 					       &func->file,
>> +--
>> +2.23.0
>> +
It does, but I'm working on an upgrade for binutils to 2.33 for master 
that I'll then apply this (and another CVE patch) on top of.

