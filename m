Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EC92C6C154
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 12:52:06 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y7so10086647wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 05:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=RZNbTUZJ8mo6F/725mzHcRIHbq6MWlaeqwjI3V75cjk=;
	b=cq/mvc+4Ppy98LEPh1KDqq7aVxkB1BOIL2ObhKIwLhxBXV/nUPqRXVGysOFXnrabx6
	x116GqzBcS3nIWYFXiqwotlaSjH2K8PolDcMmEfkDwAmL6qgMD4IXlapPj4sfpByrHuB
	/4EpTr5kCCy36huuv/ZyZJoKONZzIGl0Y4pNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=RZNbTUZJ8mo6F/725mzHcRIHbq6MWlaeqwjI3V75cjk=;
	b=hg26riD3rcBeycpvTUdysowglbiaz87xvw9ONhQwj3M9/RfaVLJ4HmbEKLkVVz+9+L
	ihfay2rQcZy0msbG6JaZ53lsnpu5JOYrSXYw3wMUp4GanBt73dDZIoMtUbznqCxvOi0r
	YGwjEdjM/2YjySfdgbMOyZ0z7jPqcCCG4Ek6YCEnYX9Poc3Z0KeA2OmzbKjFU59hJw+t
	gC0q1LSdHSDbCx7SUzejGou9nEss+nnjDa4Jm3b6S1CPsgW4yIf/9Qq4Tcc6Ngec7ard
	icGtM29bVzawXfZaXSu4BE8WU840jwpbXaSfhyw8xNO5E2GviAtCMwkPC6V8Gpvy1Thc
	wVCg==
X-Gm-Message-State: APjAAAVKcLxGkj2wqT0duLxWcE13fGusfz0craKPzPWme3cZC53sVoP9
	5BxAQ+BSuwaS959x+MJNa+SDjw==
X-Google-Smtp-Source: APXvYqyI01j6vbHkBccKnjWVyhxvb65S1W7UJcsYjHORzoVXkzwN+2ZNCfyl2P70xXDGUJVFNJcKXA==
X-Received: by 2002:adf:c18d:: with SMTP id x13mr15646746wre.246.1553604727219;
	Tue, 26 Mar 2019 05:52:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p3sm11519905wrx.71.2019.03.26.05.52.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Mar 2019 05:52:06 -0700 (PDT)
Message-ID: <f1db72a0555ba84e47dd3200627bad70a6062435.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 12:52:05 +0000
In-Reply-To: <1553565748-76030-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1553565748-76030-1-git-send-email-ee.peng.yeoh@intel.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] resulttool/merge: Enable merge results to one file
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
X-List-Received-Date: Tue, 26 Mar 2019 12:52:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-03-26 at 10:02 +0800, Yeoh Ee Peng wrote:
> QA team execute extra testing that create multiple test result files,
> where these test result files need to be merged into a single file
> under certain use case.
> 
> Enable merge to allow merging results into a single test result file.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  scripts/lib/resulttool/merge.py       | 29 ++++++++++++-
>  scripts/lib/resulttool/resultutils.py | 76 +++++++++++++++++++++++++----------
>  2 files changed, 82 insertions(+), 23 deletions(-)
> 
> diff --git a/scripts/lib/resulttool/merge.py b/scripts/lib/resulttool/merge.py
> index 3e4b7a3..90b3cb3 100644
> --- a/scripts/lib/resulttool/merge.py
> +++ b/scripts/lib/resulttool/merge.py
> @@ -17,6 +17,26 @@ import json
>  import resulttool.resultutils as resultutils
>  
>  def merge(args, logger):
> +    if args.merge_to_one:
> +        if os.path.isdir(args.target_results):
> +            target_results = resultutils.load_results(args.target_results)
> +        else:
> +            target_results = resultutils.append_results({}, args.target_results)

Looking at load_resultsdata:

def load_resultsdata(source, configmap=store_map):
    results = {}
    if os.path.isfile(source):
        append_resultsdata(results, source, configmap)
        return results

The code above can therefore be simplified to:

target_results = resultutils.load_results(args.target_results)

?

> +        if os.path.isdir(args.base_results):
> +            base_results = resultutils.load_results(args.base_results)
> +            results = resultutils.append_results(target_results, base_results)
> +        else:
> +            results = resultutils.append_results(target_results, args.base_results)


Again, I'm not sure you need to differentiate between a file and a
directory given the way the code works internally?

> +
> +        target_file_dir = os.path.join(os.path.dirname(args.target_results), 'merged_results/testresults.json')
> +        if os.path.isdir(args.target_results):
> +            target_file_dir = os.path.join(args.target_results, 'merged_results/testresults.json')
> +        if args.merge_to_one_dir:
> +            target_file_dir = os.path.join(args.merge_to_one_dir, 'testresults.json')
> +        resultutils.make_directory_and_write_json_file(target_file_dir, results)
> +        logger.info('Merged results to %s' % target_file_dir)
> +        return 0

Isn't this similar to calling load_resultsdata with the 'flatten'
mapping, i.e. resultutils.flatten_map?

That would match the code already in the merge command:

        results = resultutils.load_resultsdata(args.base_results, configmap=resultutils.flatten_map)
        if os.path.exists(args.target_results):
            resultutils.append_resultsdata(results, args.target_results, configmap=resultutils.flatten_map)
        resultutils.save_resultsdata(results, os.path.dirname(args.target_results), fn=os.path.basename(args.target_results))

i.e. if you call:

"resulttool merge XXXX merged_results/testresults.json"

it should merge the results from XXXX into the results file specified?

In other words, doesn't the tool already support this?

Cheers,

Richard




