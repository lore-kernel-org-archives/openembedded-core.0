Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 979196103C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 06:23:52 +0000 (UTC)
Received: from [192.168.101.25] (afplatform.bmw-carit.intra [192.168.101.25])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 4C06B40059;
	Thu,  4 Jul 2013 07:26:35 +0200 (CEST)
Message-ID: <51D514F5.4080304@oss.bmw-carit.de>
Date: Thu, 04 Jul 2013 08:23:49 +0200
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: vmayoral <v.mayoralv@gmail.com>
References: <1372856665-29178-1-git-send-email-v.mayoralv@gmail.com>
In-Reply-To: <1372856665-29178-1-git-send-email-v.mayoralv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apr_cv_mutex_recursive=yes added to apr_1.4.6.bb to make rosnodes work
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
X-List-Received-Date: Thu, 04 Jul 2013 06:23:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Victor,

just some comments on your commit message:

On 07/03/2013 03:04 PM, vmayoral wrote:
> From: victor <v.mayoralv@gmail.com>
>
> Working with the meta-ros project we detected that the ROS nodes didn't launch properly
This very specific meta-ros problem should not be the first line, but if 
at all, the last one in the commit message.

> the reason was that by default apr_cv_mutex_recursive in apr is set to no and this leads
> to the APRENOTIMPL return value of apr_thread_mutex_create in thread_mutex.c when
> APR_THREAD_MUTEX_NESTED is requested via flags.
instead of mentioning meta-ros, be more specific what happens in general:
... This then leads to a deadlock in applications using apr, as observed 
in an application with log4cxx.

> Added CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes" to sources/openembedded-core/meta/recipes-support/apr/apr_1.4.6.bb
> to fix this issue. It has also been removed the mention of this variable in
> meta/site/powerpc32-linux.
Maybe, complete sentences are better as well:
This commit adds CACHED_CONFIGUREVARS += "apr_cv_mutex_recursive=yes" to 
apr_1.4.6.bb and removes this variable in powerpc32-linux to address 
this issue.

(Use short file names: The exact location of the files is directly 
visible in the commit anyway.)
(Do not use "fix": It might happen that we have to look at this issue 
again at some point in the future, and then addressing an issue again 
after a "fix", seems inconsistent in retrospective. Better just say, we 
addressed it now.)

In the very end, you can refer to meta-ros, but then mention the url of 
the github repository and/or the url of the concrete issue where we 
discussed the problem. The meta-ros project and the issue you refer to 
is not globally well-known.

Just my two cents,

Lukas

P.S.: Thanks a lot for taking the initiative to carry the issue from our 
meta-ros project to the OpenEmbedded community.

