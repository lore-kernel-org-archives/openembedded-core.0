Return-Path: <pab@pabigot.com>
Received: from m1plsmtpa01-06.prod.mesa1.secureserver.net
	(m1plsmtpa01-06.prod.mesa1.secureserver.net [64.202.165.34])
	by mail.openembedded.org (Postfix) with ESMTP id 48EFE6BAC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 16:16:35 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by m1plsmtpa01-06.prod.mesa1.secureserver.net with 
	id HUGa1m00J1mTNtu01UGahu; Mon, 26 Aug 2013 09:16:35 -0700
Message-ID: <521B7F64.2080708@pabigot.com>
Date: Mon, 26 Aug 2013 11:16:36 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1377477606-17591-1-git-send-email-pab@pabigot.com>
	<521B7A4A.6030306@windriver.com>
In-Reply-To: <521B7A4A.6030306@windriver.com>
Subject: Re: [PATCH] pseudo: fix memory leak and missed privilege drop
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
X-List-Received-Date: Mon, 26 Aug 2013 16:16:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/26/2013 10:54 AM, Mark Hatle wrote:
> +diff --git a/pseudo_util.c b/pseudo_util.c
>> +index 8d0969e..16c70e0 100644
>> +--- a/pseudo_util.c
>> ++++ b/pseudo_util.c
>> +@@ -95,6 +95,33 @@ dump_env(char **envp) {
>> + }
>> + #endif
>> +
>> ++int
>> ++pseudo_has_unload(char * const *envp) {
>> ++    static const char unload[] = "PSEUDO_UNLOAD";
>> ++    static size_t unload_len = strlen(unload);
>> ++    size_t i = 0;
>> ++
>> ++    /* Is it in the caller environment? */
>> ++    if (NULL != getenv(unload))
>> ++        return 1;
>
> We actually want to use the pseudo_get_value as that ensures that the 
> internal environment configuration is sane at all times.  The issue is 
> that applications can do odd things to the environment, and just 
> checking the environment itself may not always give sane results.
>
> The rule for variables is:
>
> * PSEUDO Variables are loaded ASAP into a cache.  This way if the user 
> or program clear or modify the environment we maintain the variable.
>
> * To 'reset' the variables to different values an exec needs to be 
> performed. (Prior to the exec we also restore any missing variables 
> that have been cached to the environment.)
>
> -however- PSEUDO_UNLOAD is supposed to be special and acted on at the 
> vary next exec...  So something like the following:
>
> int
> pseudo_has_unload(char * const *envp) {
>     static const char unload[] = "PSEUDO_UNLOAD";
>     static size_t unload_len = strlen(unload);
>     char * value = NULL;
>     size_t i = 0;
>
>     value = pseudo_get_value(unload)
>     if (value) {
>         free(value);
>         return 1;
>     }
>     free(value);
>
>     /* Is it in the caller environment? */
>     if (NULL != getenv(unload))
>         return 1;
>
>     /* Is it in the operational environment? */
>     while (envp && *envp) {
>         if ((!strncmp(*envp, unload, unload_len)) && ('=' == 
> (*envp)[unload_len]))
>             return 1;
>         ++envp;
>     }
>     return 0;
> }
>
> This is -almost- the same as what you had.  The difference is that we 
> check the cached value first, and use the get_value function which 
> does all of the setup and comparison using the common function.  This 
> ensures that the environment cache is properly configured as early as 
> possible, only one accessor of the cache is used and it also checks 
> the running and operation cache for the alternative value (in the same 
> way your patch did it).

Sure; I figured this was a special case, there was no point in 
allocating and immediately throwing away a value, and that since nobody 
looked at the value there was no need to update the cache through this 
call and the other cache routines would do it if necessary.  But the 
intent of the API wasn't entirely clear.  Based on what you said I'd 
probably refactor pseudo_get_value() so it and pseudo_has_unload() would 
share the code that located a matching cache entry, then duplicate the 
return value only to satisfy the API for pseudo_get_value().  Checking 
for PSEUDO_UNLOAD happens a lot in bitbaking images, so making it fast 
seems worthwhile.

I'm happy to leave this in your hands, including whether the fix 
includes a new version of pseudo or just a patch in the recipe.

Peter

